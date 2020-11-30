using GLFW, CEnum

include("Bgfx.jl")

GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API);
window = GLFW.CreateWindow(640, 480, "GLFW.jl")
bgfx_render_frame(Int32(-1));

# Missing wrapper so do it by hand
glfwGetWin32Window(window::GLFW.Window) = @ccall glfwGetWin32Window(window.handle::Ptr{Nothing})::Ptr{Nothing}

# TODO: Fix defaults
init = bgfx_init_s(
    BGFX_RENDERER_TYPE_NOOP,
    0,
    0,
    false,
    false,
    bgfx_platform_data_t(0, glfwGetWin32Window(window), 0, 0, 0),
    bgfx_resolution_t(BGFX_TEXTURE_FORMAT_UNKNOWN, 640, 480, BGFX_RESET_VSYNC, 0, 0),
    bgfx_init_limits_t(0, 0, 0, 0),
	0,
    0
)
bgfx_init(init)
const kClearView = 0;
bgfx_set_view_clear(kClearView, BGFX_CLEAR_COLOR)
bgfx_set_view_rect(kClearView, 0, 0, BGFX_BACKBUFFER_RATIO_EQUAL)

# Loop until the user closes the window
while !GLFW.WindowShouldClose(window)

	# Render here

	# Swap front and back buffers
	GLFW.SwapBuffers(window)

	# Poll for and process events
	GLFW.PollEvents()
end

GLFW.DestroyWindow(window)
