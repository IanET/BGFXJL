println("Loading")
using Clang, Clang.LibClang, Printf

if VERSION > v"1.5"
    Base.exit_on_sigint(false) # catch ctrl-c, needs julia 1.5
end

# ----------------------------------------------------------------------------
# const msvc = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\"
const msvc = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\"
const vcinc = msvc * "VC\\Tools\\MSVC\\14.28.29333\\include"
# const ucrt = msvc * "SDK\\ScopeCppSDK\\vc15\\SDK\\include\\ucrt" 
const ucrt = "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.18362.0\\ucrt\\"

const bx = "bgfx"
const includes = [vcinc, ucrt, bx]

const  args = ["-fms-compatibility", "-ferror-limit=10"]

function wrap_stuff(rootHeader::String, filterHeaders::Array{String}, libName::String)
    println("Wrapping $filterHeaders starting from $rootHeader")
    wrapped = Vector{String}()
    ctx = DefaultContext()
    ctx.libname = libName

    parse_headers!(ctx, [rootHeader], args = args, includes = includes)

    for trans_unit in ctx.trans_units
        root_cursor = getcursor(trans_unit)
        push!(ctx.cursor_stack, root_cursor)
        ctx.children = children(root_cursor)
        for (i, child) in enumerate(ctx.children)
            child_name = name(child)
            child_header = filename(child)
            ctx.children_index = i
            startswith(child_name, "__") && continue  # skip compiler definitions
            child_name in wrapped && continue # already Done
            # !(child_header in filterHeaders) && @info "Ignoring $child_header"
            !(child_header in filterHeaders) && continue # not in the list of headers we care about
            push!(wrapped, child_name)
            try
                wrap!(ctx, child)
                # println("Wrapped $child_name")
                print(".")
            catch exc
                if isa(exc, InterruptException) rethrow() end
                println("Unable to wrap $child_name $exc")
                dump(exc)
            end
        end
        println("")
    end

    # Write "common" definitions: types, typealiases, etc.
    path = joinpath(@__DIR__, ctx.libname * ".jl")
    println("Writing $path")
    open(path, "w") do f
        println(f, "# Automatically generated using Clang.jl\n")
        # println(f, "const $libName = \"$libName\" ")
        print_buffer(f, dump_to_buffer(ctx.common_buffer))
        print_buffer(f, ctx.api_buffer)
    end
    println("Done")
end

wrap_stuff("bgfx.h", ["./bgfx/c99/../defines.h", "bgfx.h", "./bgfx/c99/bgfx.h"], "bgfx")
