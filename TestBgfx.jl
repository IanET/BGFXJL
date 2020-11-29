using GLFW, CEnum

include("Bgfx.jl")

# Create a window and its OpenGL context
# GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API);
window = GLFW.CreateWindow(640, 480, "GLFW.jl")

# Make the window's context current
GLFW.MakeContextCurrent(window)

# Loop until the user closes the window
while !GLFW.WindowShouldClose(window)

	# Render here

	# Swap front and back buffers
	GLFW.SwapBuffers(window)

	# Poll for and process events
	GLFW.PollEvents()
end

GLFW.DestroyWindow(window)
