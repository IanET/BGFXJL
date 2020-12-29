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

    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
        bgfx_set_view_rect(viewID, UInt16(0), UInt16(0), UInt16(width), UInt16(height));
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
 