using GLFW, GLFW_jll, CEnum, LinearAlgebra, StaticArrays, Printf

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

MMatrix4x4() = zeros(MMatrix4x4)

struct PosColorVertex
    x::Float32
    y::Float32
    z::Float32
    abgr::UInt32
end
Base.convert(::Type{PosColorVertex}, x::Array) = PosColorVertex(Float32(x[1]), Float32(x[2]), Float32(x[3]), Float32(x[4]))

# function calcLookAt!(camera::Vector3, target::Vector3, up::Vector3, lookat::MMatrix4x4)
#     zaxis = normalize(camera - target)
#     xaxis = normalize(cross(up, zaxis))
#     yaxis = cross(zaxis, xaxis)

#     lookat[1,1] = xaxis[1]
#     lookat[2,1] = yaxis[1]
#     lookat[3,1] = zaxis[1]
#     lookat[4,1] = 0.0f0

#     lookat[1,2] = xaxis[2]
#     lookat[2,2] = yaxis[2]
#     lookat[3,2] = zaxis[2]
#     lookat[4,2] = 0.0f0

#     lookat[1,3] = xaxis[3]
#     lookat[2,3] = yaxis[3]
#     lookat[3,3] = zaxis[3]
#     lookat[4,3] = 0.0f0

#     lookat[1,4] = -dot(xaxis, camera)
#     lookat[2,4] = -dot(yaxis, camera)
#     lookat[3,4] = -dot(zaxis, camera)
#     lookat[4,4] = 1.0    
# end

function calcLookAt(camera::Vector3, target::Vector3, up::Vector3)::Matrix4x4
    zaxis::Vector3 = normalize(camera - target)
    xaxis::Vector3 = normalize(cross(up, zaxis))
    yaxis::Vector3 = cross(zaxis, xaxis)

    return @SMatrix [ xaxis[1] xaxis[2] xaxis[3] -dot(xaxis, camera);
                      yaxis[1] yaxis[2] yaxis[3] -dot(yaxis, camera);
                      zaxis[1] zaxis[2] zaxis[3] -dot(zaxis, camera);
                      0.0      0.0      0.0      1.0]
end

# function calcPerspectiveFieldOfView!(fieldOfView::Float32, aspectRatio::Float32, nearPlaneDistance::Float32, 
#         farPlaneDistance::Float32, fov::MMatrix4x4)
#     yScale = 1.0f0 / tan(fieldOfView * 0.5f0);
#     xScale = yScale / aspectRatio;

#     fov[1,1] = xScale
#     fov[2,2] = yScale;
#     fov[3,3] = farPlaneDistance / (nearPlaneDistance - farPlaneDistance)
#     fov[3,4] = (nearPlaneDistance * farPlaneDistance) / (nearPlaneDistance - farPlaneDistance)
#     fov[4,3] = -1.0
# end

function calcPerspectiveFieldOfView(fieldOfView::Float32, aspectRatio::Float32, nearPlaneDistance::Float32, farPlaneDistance::Float32)::Matrix4x4
    yScale = 1.0f0 / tan(fieldOfView * 0.5f0);
    xScale = yScale / aspectRatio;

    v1 = farPlaneDistance / (nearPlaneDistance - farPlaneDistance)
    v2 = (nearPlaneDistance * farPlaneDistance) / (nearPlaneDistance - farPlaneDistance)
    return @SMatrix [ xScale  0.0     0.0     0.0;
                      0.0     yScale  0.0     0.0;
                      0.0     0.0     v1      v2;
                      0.0     0.0     -1.0    0.0 ]
end

# function transformFromYawPitchRoll!(yaw::Float32, pitch::Float32, roll::Float32, transform::MMatrix4x4)
#     halfRoll = roll / 2.0
#     sr = sin(halfRoll)
#     cr = cos(halfRoll)

#     halfPitch = pitch / 2.0
#     sp = sin(halfPitch)
#     cp = cos(halfPitch)

#     halfYaw = yaw / 2.0
#     sy = sin(halfYaw)
#     cy = cos(halfYaw)

#     x = cy * sp * cr + sy * cp * sr
#     y = sy * cp * cr - cy * sp * sr
#     z = cy * cp * sr - sy * sp * cr
#     w = cy * cp * cr + sy * sp * sr

#     xx = x * x
#     yy = y * y
#     zz = z * z

#     xy = x * y
#     wz = z * w
#     xz = z * x
#     wy = y * w
#     yz = y * z
#     wx = x * w

#     transform[1,1] = 1.0 - 2.0 * (yy + zz)
#     transform[2,1] = 2.0 * (xy + wz)
#     transform[3,1] = 2.0 * (xz - wy)
#     transform[4,1] = 0.0

#     transform[1,2] = 2.0 * (xy - wz)
#     transform[2,2] = 1.0 - 2.0 * (zz + xx)
#     transform[3,2] = 2.0 * (yz + wx)
#     transform[4,2] = 0.0

#     transform[1,3] = 2.0 * (xz + wy)
#     transform[2,3] = 2.0 * (yz - wx)
#     transform[3,3] = 1.0 - 2.0 * (yy + xx)
#     transform[4,3] = 0.0

#     transform[1,4] = 0.0
#     transform[2,4] = 0.0
#     transform[3,4] = 0.0
#     transform[4,4] = 1.0
# end

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

    xx = x * x
    yy = y * y
    zz = z * z

    xy = x * y
    wz = z * w
    xz = z * x
    wy = y * w
    yz = y * z
    wx = x * w

    m11 = 1.0 - 2.0 * (yy + zz)
    m21 = 2.0 * (xy + wz)
    m31 = 2.0 * (xz - wy)
    m41 = 0.0

    m12 = 2.0 * (xy - wz)
    m22 = 1.0 - 2.0 * (zz + xx)
    m32 = 2.0 * (yz + wx)
    m42 = 0.0

    m13 = 2.0 * (xz + wy)
    m23 = 2.0 * (yz - wx)
    m33 = 1.0 - 2.0 * (yy + xx)
    m43 = 0.0

    m14 = 0.0
    m24 = 0.0
    m34 = 0.0
    m44 = 1.0

    return @SMatrix [ m11 m12 m13 m14;
                      m21 m22 m23 m24;
                      m31 m32 m33 m34;
                      m41 m42 m43 m44 ]
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

    lastFrameTime = time()
    startTime = time()
    
    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)
        @time begin

        GLFW.PollEvents()
        bgfx_set_view_rect(viewID, 0x0000, 0x0000, UInt16(width), UInt16(height))
        viewMatrix = calcLookAt(Vector3(0.0f0, 0.0f0, -35.0f0), Vector3(0.0f0, 0.0f0, 0.0f0), UP_VECTOR)
        projMatrix = calcPerspectiveFieldOfView(Float32(π / 3), Float32(width / height), 0.10f0, 100.0f0)
        bgfx_set_view_transform(viewID, viewMatrix, projMatrix)

        bgfx_touch(viewID)

        now = time()
        framedt = now - lastFrameTime
        lastFrameTime = now
        startdt = now - startTime

        bgfx_dbg_text_clear(0x00, false)
        bgfx_dbg_text_printf(0x0000, 0x0001, 0x1f, @sprintf("Julia Cubes: %d", trunc(framedt*1000))) # 4 allocations

        for y = 0:11
            for x = 0:11
                t1 = transformFromYawPitchRoll(Float32(startdt + x * 0.21), Float32(startdt + y * 0.37), 0.0f0)
                v1 = Float32(-15.0 + x * 3.0)
                v2 = Float32(-15.0 + y * 3.0)
                t2 = @SMatrix [ t1[1,1] t1[1,2] t1[1,3] v1;
                                t1[2,1] t1[2,2] t1[2,3] v2;
                                t1[3,1] t1[3,2] t1[3,3] 0.0f0;
                                t1[4,1] t1[4,2] t1[4,3] t1[4,4] ]
                bgfx_set_transform(t2, 0x0001)

                bgfx_set_vertex_buffer(0x00, vbh, UInt32(0), length(cubeVertices) |> UInt32)
                bgfx_set_index_buffer(ibh, UInt32(0), length(cubeTriList) |> UInt32)

                bgfx_set_state(BGFX_STATE_DEFAULT, UInt32(0))
                bgfx_submit(viewID, program, UInt32(0), BGFX_DISCARD_ALL)
            end
        end
                
        bgfx_frame(false)

        end

    end

    bgfx_destroy_index_buffer(ibh)
    bgfx_destroy_vertex_buffer(vbh)
    bgfx_shutdown() 
    GLFW.DestroyWindow(window)
    GLFW.Terminate()
end

main()
 