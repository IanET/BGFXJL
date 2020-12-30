using GLFW, GLFW_jll, CEnum

const BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA) = (UInt64(_srcRGB) | UInt64(_dstRGB) << 4) | ((UInt64(_srcA) | UInt64(_dstA) << 4) << 8)
const BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA) = (_equationRGB | (_equationA << 3))
  
function bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::String)
    @ccall bgfx.bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::Cstring)::Cvoid
end

function glfwGetWin32Window(window::GLFW.Window) 
    @ccall "glfw3".glfwGetWin32Window(window.handle::Ptr{Nothing})::Ptr{Nothing}
end

include("Bgfx.jl")
   
function main()
    width = 800
    height = 600
    viewID = UInt16(0)

    GLFW.Init()
    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API);
    window = GLFW.CreateWindow(width, height, "GLFW")
    pd = bgfx_platform_data_t(0, glfwGetWin32Window(window), 0, 0, 0)
    res = bgfx_resolution_t(BGFX_TEXTURE_FORMAT_RGBA8, width, height, BGFX_RESET_VSYNC, 0, 0)
    limits = bgfx_init_limits_t(0, 0, 0, 0)
    init = bgfx_init_t(BGFX_RENDERER_TYPE_COUNT, 0, 0, false, false, pd, res, limits, 0, 0)
    bgfx_init(Ref(init))
    bgfx_set_debug(BGFX_DEBUG_TEXT);

    bgfx_set_view_clear(viewID, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x443355FF, Float32(1.0), UInt8(0))

    struct PosColorVertex
        x::Float32
        y::Float32
        z::Float32
        abgr::UInt32
    end
        
    const cubeVertices::PosColorVertex[] = [
        [-1.0f,  1.0f,  1.0f, 0xff000000],
        [ 1.0f,  1.0f,  1.0f, 0xff0000ff],
        [-1.0f, -1.0f,  1.0f, 0xff00ff00],
        [ 1.0f, -1.0f,  1.0f, 0xff00ffff],
        [-1.0f,  1.0f, -1.0f, 0xffff0000],
        [ 1.0f,  1.0f, -1.0f, 0xffff00ff],
        [-1.0f, -1.0f, -1.0f, 0xffffff00],
        [ 1.0f, -1.0f, -1.0f, 0xffffffff]
    ]
    
    const cubeTriList::UInt16[] = [
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
    ];


    # // load shaders
    # var program = ResourceLoader.LoadProgram("vs_cubes", "fs_cubes");

    layout = Ref(bgfx_vertex_layout_t(0, 0, tuple(zeros(18)), tuple(zeros(18))))
    bgfx_vertex_layout_begin(layout, BGFX_RENDERER_TYPE_NOOP)
    bgfx_vertex_layout_add(layout, BGFX_ATTRIB_POSITION, 3, BGFX_ATTRIB_TYPE_FLOAT, false, false)
    bgfx_vertex_layout_add(layout, BGFX_ATTRIB_COLOR0, 4, BGFX_ATTRIB_TYPE_UINT8, true, false)
    bgfx_vertex_layout_end(layout)
    memVerts = bgfx_make_ref(Ref(cubeVertices), sizeof(cubeVertices))
    bgfx_create_vertex_buffer(memVerts, layout, BGFX_BUFFER_NONE)

    memTris = bgfx_make_ref(Ref(cubeTriList), sizeof(cubeTriList))
    bgfx_create_index_buffer(memTris, BGFX_BUFFER_NONE)

    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
        bgfx_set_view_rect(viewID, UInt16(0), UInt16(0), UInt16(width), UInt16(height));

        # var viewMatrix = Matrix4x4.CreateLookAt(new Vector3(0.0f, 0.0f, -35.0f), Vector3.Zero, Vector3.UnitY);
        # var projMatrix = Matrix4x4.CreatePerspectiveFieldOfView((float)Math.PI / 3, (float)sample.WindowWidth / sample.WindowHeight, 0.1f, 100.0f);
        # Bgfx.SetViewTransform(0, &viewMatrix.M11, &projMatrix.M11);


        bgfx_touch(viewID)
        bgfx_dbg_text_clear(UInt8(0), false);
        bgfx_dbg_text_printf(UInt16(0), UInt16(1), 0x1f, "bgfx/examples/25-c99");
        bgfx_frame(false)
    end

    bgfx_shutdown() 
    GLFW.DestroyWindow(window)
    GLFW.Terminate()
end

main()
 