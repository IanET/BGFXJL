using GLFW, GLFW_jll, CEnum, LinearAlgebra, StaticArrays, Printf
import Base.@kwdef

const BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA) = (UInt64(_srcRGB) | UInt64(_dstRGB) << 4) | ((UInt64(_srcA) | UInt64(_dstA) << 4) << 8)
const BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA) = (_equationRGB | (_equationA << 3))
  
function bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::String)
    @ccall bgfx.bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::Cstring)::Cvoid
end

function glfwGetWin32Window(window::GLFW.Window) 
    @ccall "glfw3".glfwGetWin32Window(window.handle::Ptr{Nothing})::Ptr{Nothing}
end

include("Bgfx.jl")

# NB Julia is column major and c expects row order so matrix math will be rotated to avoid a copy
const Vector3 = SVector{3,Float32}
const MVector3 = MVector{3,Float32}
const Matrix4x4 = SMatrix{4, 4, Float32} 
const MMatrix4x4 = MMatrix{4, 4, Float32}
const UP_VECTOR = Vector3(0.0f0, 1.0f0, 0.0f0)
const F32 = Float32

MMatrix4x4() = zeros(MMatrix4x4)

struct PosColorVertex
    x::Float32
    y::Float32
    z::Float32
    abgr::UInt32
end
Base.convert(::Type{PosColorVertex}, x::Array) = PosColorVertex(Float32(x[1]), Float32(x[2]), Float32(x[3]), Float32(x[4]))

function calcLookAt(camera::Vector3, target::Vector3, up::Vector3)::Matrix4x4
    zaxis::Vector3 = normalize(camera - target)
    xaxis::Vector3 = normalize(cross(up, zaxis))
    yaxis::Vector3 = cross(zaxis, xaxis)
    v1 = -dot(xaxis, camera)
    v2 = -dot(yaxis, camera)
    v3 = -dot(zaxis, camera)
    f0 = 0.0
    f1 = 1.0
    return @SMatrix [ xaxis[1] xaxis[2] xaxis[3] v1;
                      yaxis[1] yaxis[2] yaxis[3] v2;
                      zaxis[1] zaxis[2] zaxis[3] v3;
                      f0       f0       f0       f1 ]
end

function calcPerspectiveFieldOfView(fieldOfView::Float32, aspectRatio::Float32, nearPlaneDistance::Float32, farPlaneDistance::Float32)::Matrix4x4
    ys = 1.0/ tan(fieldOfView * 0.5);
    xs = ys / aspectRatio;
    v1 = farPlaneDistance / (nearPlaneDistance - farPlaneDistance)
    v2 = (nearPlaneDistance * farPlaneDistance) / (nearPlaneDistance - farPlaneDistance)
    v3 = -1.0
    f0 = 0.0

    return @SMatrix [ xs f0 f0 f0;
                      f0 ys f0 f0;
                      f0 f0 v1 v2;
                      f0 f0 v3 f0 ]
end

function transformFromYawPitchRoll(yaw::Float32, pitch::Float32, roll::Float32)::Matrix4x4
    halfRoll = roll / 2.0
    sr = sin(halfRoll)
    cr = cos(halfRoll)

    halfPitch = pitch / 2.0
    sp = sin(halfPitch)
    cp = cos(halfPitch)

    halfYaw = yaw / 2.0
    sy = sin(halfYaw)
    cy = cos(halfYaw)

    x = cy * sp * cr + sy * cp * sr
    y = sy * cp * cr - cy * sp * sr
    z = cy * cp * sr - sy * sp * cr
    w = cy * cp * cr + sy * sp * sr

    x² = x^2; y² = y^2; z² = z^2

    xy = x * y
    wz = z * w
    xz = z * x
    wy = y * w
    yz = y * z
    wx = x * w

    m11 = 1 - 2(y² + z²)
    m21 = 2(xy + wz)
    m31 = 2(xz - wy)
    m41 = 0

    m12 = 2(xy - wz)
    m22 = 1 - 2(z² + x²)
    m32 = 2(yz + wx)
    m42 = 0

    m13 = 2(xz + wy)
    m23 = 2(yz - wx)
    m33 = 1 - 2(y² + x²)
    m43 = 0

    m14 = 0.0
    m24 = 0.0
    m34 = 0.0
    m44 = 1.0

    return @SMatrix [ m11 m12 m13 m14;
                      m21 m22 m23 m24;
                      m31 m32 m33 m34;
                      m41 m42 m43 m44 ]
end
    
const CUBE_VERTICES = PosColorVertex[
    [-1.0,  1.0,  1.0, 0xff000000],
    [ 1.0,  1.0,  1.0, 0xff0000ff],
    [-1.0, -1.0,  1.0, 0xff00ff00],
    [ 1.0, -1.0,  1.0, 0xff00ffff],
    [-1.0,  1.0, -1.0, 0xffff0000],
    [ 1.0,  1.0, -1.0, 0xffff00ff],
    [-1.0, -1.0, -1.0, 0xffffff00],
    [ 1.0, -1.0, -1.0, 0xffffffff]
]

const CUBE_TRIS = UInt16[
    0, 1, 2,
    1, 3, 2,
    4, 6, 5,
    5, 6, 7,
    0, 2, 4,
    4, 2, 6,
    1, 5, 3,
    5, 7, 3,
    0, 4, 1,
    4, 5, 1,
    2, 3, 6,
    6, 3, 7,
]

@kwdef mutable struct FrameStats
    time::Float64 = 0.0
    frames::Int = 0
    fps::Float32 = 0.0
end

function update(fs::FrameStats)
    fs.frames += 1
    d = time() - fs.time
    if d > 1.0
        fs.fps = fs.frames / d
        fs.frames = 0
        fs.time = time()
    end 
end

function main()
    width::UInt16 = 1280
    height::UInt16 = 720
    viewID = 0x0000
    stats = FrameStats()

    GLFW.Init()
    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API)
    window = GLFW.CreateWindow(width, height, "GLFW")
    pd = bgfx_platform_data_t(0, glfwGetWin32Window(window), 0, 0, 0)
    res = bgfx_resolution_t(BGFX_TEXTURE_FORMAT_RGBA8, width, height, BGFX_RESET_VSYNC, 0, 0)
    limits = bgfx_init_limits_t(0, 0, 0, 0)
    init = bgfx_init_t(BGFX_RENDERER_TYPE_COUNT, 0, 0, false, false, pd, res, limits, 0, 0)
    bgfx_init(Ref(init))
    bgfx_set_debug(BGFX_DEBUG_TEXT)

    bgfx_set_view_clear(viewID, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x443355FF, 1.0f0, UInt8(0))

    vsbytes = read("vs_cubes_dx11.bin")
    vsmem = bgfx_copy(vsbytes, length(vsbytes) |> UInt32)
    vs = bgfx_create_shader(vsmem)

    fsbytes = read("fs_cubes_dx11.bin")
    fsmem = bgfx_copy(fsbytes, length(fsbytes) |> UInt32)
    fs = bgfx_create_shader(fsmem)
    program = bgfx_create_program(vs, fs, false)

    layout = Ref(bgfx_vertex_layout_t(0, 0, tuple(zeros(UInt16, 18)...), tuple(zeros(UInt16, 18)...)))
    bgfx_vertex_layout_begin(layout, BGFX_RENDERER_TYPE_NOOP)
    bgfx_vertex_layout_add(layout, BGFX_ATTRIB_POSITION, 0x03, BGFX_ATTRIB_TYPE_FLOAT, false, false)
    bgfx_vertex_layout_add(layout, BGFX_ATTRIB_COLOR0, 0x04, BGFX_ATTRIB_TYPE_UINT8, true, false)
    bgfx_vertex_layout_end(layout)
    memVerts = bgfx_copy(CUBE_VERTICES, sizeof(CUBE_VERTICES) |> UInt32)
    vbh = bgfx_create_vertex_buffer(memVerts, layout, BGFX_BUFFER_NONE)
    memTris = bgfx_copy(CUBE_TRIS, sizeof(CUBE_TRIS) |> UInt32)
    ibh = bgfx_create_index_buffer(memTris, BGFX_BUFFER_NONE)

    viewMatrix = calcLookAt(Vector3(0.0f0, 0.0f0, -35.0f0), Vector3(0.0f0, 0.0f0, 0.0f0), UP_VECTOR)
    projMatrix = calcPerspectiveFieldOfView(Float32(π / 3), Float32(width / height), 0.10f0, 100.0f0)

    lastFrameTime = time()
    startTime = time()
    
    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
        bgfx_set_view_rect(viewID, 0x0000, 0x0000, width, height)
        bgfx_set_view_transform(viewID, viewMatrix, projMatrix)
        bgfx_touch(viewID)

        now = time()
        # framedt = now - lastFrameTime
        lastFrameTime = now
        startdt = now - startTime

        bgfx_dbg_text_clear(0x00, false)
        # bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, @sprintf("Julia Cubes: %d", trunc(framedt*1000))) # 2 allocations
        # @time bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, @sprintf("Julia Cubes: %.1f", fpsinfo.fps)) # 2 allocations
        bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, @sprintf("FPS: %d", round(Int, stats.fps))) # 2 allocations
        # @time bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, "Julia Cubes: $(round(Int, fpsinfo.fps))") # 5 aollocations

        for y = 0:11, x = 0:11
            t1 = transformFromYawPitchRoll(Float32(startdt + x * 0.21), Float32(startdt + y * 0.37), 0.0f0)
            tx = Float32(-15 + x * 3)
            ty = Float32(-15 + y * 3)
            f0 = 0.0f0
            t2 = @SMatrix [ t1[1,1] t1[1,2] t1[1,3] tx;
                            t1[2,1] t1[2,2] t1[2,3] ty;
                            t1[3,1] t1[3,2] t1[3,3] f0;
                            t1[4,1] t1[4,2] t1[4,3] t1[4,4] ]
            bgfx_set_transform(t2, 0x0001)

            bgfx_set_vertex_buffer(0x00, vbh, UInt32(0), length(CUBE_VERTICES) |> UInt32)
            bgfx_set_index_buffer(ibh, UInt32(0), length(CUBE_TRIS) |> UInt32)

            bgfx_set_state(BGFX_STATE_DEFAULT, UInt32(0))
            bgfx_submit(viewID, program, UInt32(0), BGFX_DISCARD_ALL)
        end
                
        bgfx_frame(false)
        update(stats)
    end

    bgfx_destroy_index_buffer(ibh)
    bgfx_destroy_vertex_buffer(vbh)
    bgfx_shutdown() 
    GLFW.DestroyWindow(window)
    GLFW.Terminate()
end

main()
