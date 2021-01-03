using GLFW, GLFW_jll, CEnum, LinearAlgebra, StaticArrays

const BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA) = (UInt64(_srcRGB) | UInt64(_dstRGB) << 4) | ((UInt64(_srcA) | UInt64(_dstA) << 4) << 8)
const BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA) = (_equationRGB | (_equationA << 3))
  
function bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::String)
    @ccall bgfx.bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::Cstring)::Cvoid
end

function glfwGetWin32Window(window::GLFW.Window) 
    @ccall "glfw3".glfwGetWin32Window(window.handle::Ptr{Nothing})::Ptr{Nothing}
end

include("Bgfx.jl")

const Vector3 = MVector{3,Float32}
const Matrix4x4 = MMatrix{4, 4, Float32} # NB Julia is column major and c expects row order
const UP_VECTOR = Vector3(0.0f0, 1.0f0, 0.0f0)

Matrix4x4() = zeros(Matrix4x4)

# Matrix4x4() = Matrix{Float32}(undef, 4, 4)
# Matrix4x4(x::Float32) = fill(x, (4, 4))
# Matrix4x4(I::UniformScaling{Bool}) = Matrix{Float32}(I, 4, 4)

struct PosColorVertex
    x::Float32
    y::Float32
    z::Float32
    abgr::UInt32
end
Base.convert(::Type{PosColorVertex}, x::Array) = PosColorVertex(Float32(x[1]), Float32(x[2]), Float32(x[3]), Float32(x[4]))

function calcLookAt!(camera::Vector3, target::Vector3, up::Vector3, lookat::Matrix4x4)
    zaxis = normalize(camera - target)
    xaxis = normalize(cross(up, zaxis))
    yaxis = cross(zaxis, xaxis)

    lookat[1,1] = xaxis[1]
    lookat[2,1] = yaxis[1]
    lookat[3,1] = zaxis[1]
    lookat[4,1] = 0.0f0

    lookat[1,2] = xaxis[2]
    lookat[2,2] = yaxis[2]
    lookat[3,2] = zaxis[2]
    lookat[4,2] = 0.0f0

    lookat[1,3] = xaxis[3]
    lookat[2,3] = yaxis[3]
    lookat[3,3] = zaxis[3]
    lookat[4,3] = 0.0f0

    lookat[1,4] = -dot(xaxis, camera)
    lookat[2,4] = -dot(yaxis, camera)
    lookat[3,4] = -dot(zaxis, camera)
    lookat[4,4] = 1.0    
    
    return lookat
end

function createPerspectiveFieldOfView(fieldOfView::Float32, aspectRatio::Float32, nearPlaneDistance::Float32, 
        farPlaneDistance::Float32)::Matrix4x4
    yScale = 1.0f0 / tan(fieldOfView * 0.5f0);
    xScale = yScale / aspectRatio;

    fov = Matrix4x4()
    fov[1,1] = xScale
    fov[2,2] = yScale;
    fov[3,3] = farPlaneDistance / (nearPlaneDistance - farPlaneDistance)
    fov[3,4] = (nearPlaneDistance * farPlaneDistance) / (nearPlaneDistance - farPlaneDistance)
    fov[4,3] = -1.0

    return fov;
end

function createFromYawPitchRoll(yaw::Float32, pitch::Float32, roll::Float32)::Matrix4x4
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

    xx = x * x
    yy = y * y
    zz = z * z

    xy = x * y
    wz = z * w
    xz = z * x
    wy = y * w
    yz = y * z
    wx = x * w

    result = Matrix4x4()
    result[1,1] = 1.0 - 2.0 * (yy + zz)
    result[2,1] = 2.0 * (xy + wz)
    result[3,1] = 2.0 * (xz - wy)
    result[4,1] = 0.0

    result[1,2] = 2.0 * (xy - wz)
    result[2,2] = 1.0 - 2.0 * (zz + xx)
    result[3,2] = 2.0 * (yz + wx)
    result[4,2] = 0.0

    result[1,3] = 2.0 * (xz + wy)
    result[2,3] = 2.0 * (yz - wx)
    result[3,3] = 1.0 - 2.0 * (yy + xx)
    result[4,3] = 0.0

    result[1,4] = 0.0
    result[2,4] = 0.0
    result[3,4] = 0.0
    result[4,4] = 1.0

    return result
end

function main()
    width = 1280
    height = 720
    viewID = UInt16(0)

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
        
    cubeVertices = PosColorVertex[
        [-1.0,  1.0,  1.0, 0xff000000],
        [ 1.0,  1.0,  1.0, 0xff0000ff],
        [-1.0, -1.0,  1.0, 0xff00ff00],
        [ 1.0, -1.0,  1.0, 0xff00ffff],
        [-1.0,  1.0, -1.0, 0xffff0000],
        [ 1.0,  1.0, -1.0, 0xffff00ff],
        [-1.0, -1.0, -1.0, 0xffffff00],
        [ 1.0, -1.0, -1.0, 0xffffffff]
    ]

    cubeTriList = UInt16[
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
    memVerts = bgfx_copy(cubeVertices, sizeof(cubeVertices) |> UInt32)
    vbh = bgfx_create_vertex_buffer(memVerts, layout, BGFX_BUFFER_NONE)

    memTris = bgfx_copy(cubeTriList, sizeof(cubeTriList) |> UInt32)
    ibh = bgfx_create_index_buffer(memTris, BGFX_BUFFER_NONE)

    # Loop until the user closes the window
    lastFrameTime = time()
    startTime = time()
    viewMatrix = Matrix4x4()
    camera = Vector3(0.0f0, 0.0f0, -35.0f0)
    target = Vector3(0.0f0, 0.0f0, 0.0f0)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()

        bgfx_set_view_rect(viewID, 0x0000, 0x0000, UInt16(width), UInt16(height))
        @time calcLookAt!(camera, target, UP_VECTOR, viewMatrix)
        projMatrix = createPerspectiveFieldOfView(Float32(π / 3), Float32(width / height), 0.10f0, 100.0f0)
        bgfx_set_view_transform(viewID, viewMatrix, projMatrix)

        bgfx_touch(viewID)

        now = time()
        framedt = now - lastFrameTime
        lastFrameTime = now
        startdt = now - startTime

        bgfx_dbg_text_clear(0x00, false);
        bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, "Julia Cubes: $(UInt32(round(framedt*1000)))");

        for y = 0:11
            for x = 0:11
                transform = createFromYawPitchRoll(Float32(startdt + x * 0.21), Float32(startdt + y * 0.37), 0.0f0)
                transform[1,4] = -15.0 + x * 3.0
                transform[2,4] = -15.0 + y * 3.0
                transform[3,4] = 0.0
                bgfx_set_transform(transform, 0x0001)

                bgfx_set_vertex_buffer(0x00, vbh, UInt32(0), length(cubeVertices) |> UInt32)
                bgfx_set_index_buffer(ibh, UInt32(0), length(cubeTriList) |> UInt32)

                bgfx_set_state(BGFX_STATE_DEFAULT, UInt32(0))
                bgfx_submit(viewID, program, UInt32(0), BGFX_DISCARD_ALL);
            end
        end
                
        bgfx_frame(false)
    end

    bgfx_destroy_index_buffer(ibh)
    bgfx_destroy_vertex_buffer(vbh)
    bgfx_shutdown() 
    GLFW.DestroyWindow(window)
    GLFW.Terminate()
end

main()
 