using GLFW, GLFW_jll, CEnum 

const bgfx = "bgfx-shared-librelease.dll"

const UINT64_C(x) = UInt64(x)
const UINT32_C(x) = UInt32(x)
const UINT16_C(x) = UInt16(x)
const UINT8_C(x) = UInt8(x)
  
const dllexport = nothing
const dllimport = nothing

const BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA) = 
    (UInt64(_srcRGB) | UInt64(_dstRGB) << 4) | ((UInt64(_srcA) | UInt64(_dstA) << 4) << 8)
const BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA) = (_equationRGB | (_equationA << 3))
  
function bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::String)
    @ccall bgfx.bgfx_dbg_text_printf(_x::UInt16, _y::UInt16, _attr::UInt8, _format::Cstring)::Cvoid
end

include("Bgfx.jl")
   
function main()
    width = 640
    height = 480
    viewID = UInt16(0)

    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API);
    window = GLFW.CreateWindow(width, height, "GLFW.jl")
    bgfx_render_frame(Int32(-1));

    # Missing wrapper so do it by hand
    glfwGetWin32Window(window::GLFW.Window) = @ccall "glfw3".glfwGetWin32Window(window.handle::Ptr{Nothing})::Ptr{Nothing}

    # TODO: Fix defaults
    init = bgfx_init_t(
        BGFX_RENDERER_TYPE_NOOP,
        0,
        0,
        false,
        false,
        bgfx_platform_data_t(0, glfwGetWin32Window(window), 0, 0, 0),
        bgfx_resolution_t(BGFX_TEXTURE_FORMAT_UNKNOWN, width, height, BGFX_RESET_VSYNC, 0, 0),
        bgfx_init_limits_t(0, 0, 0, 0),
        0,
        0
    )
    bgfx_init(Ref(init))
    bgfx_set_debug(BGFX_DEBUG_TEXT);

    bgfx_set_view_clear(viewID, BGFX_CLEAR_COLOR | BGFX_CLEAR_DEPTH, 0x303030ff, Float32(1.0), UInt8(0))

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
 