# Automatically generated using Clang.jl

const bgfx = "bgfx" 

# Skipping MacroDefinition: BGFX_INVALID_HANDLE { UINT16_MAX }

const BGFX_SHARED_LIB_BUILD = 0
const BGFX_SHARED_LIB_USE = 0

# Skipping MacroDefinition: BGFX_SYMBOL_EXPORT __declspec ( dllexport )
# Skipping MacroDefinition: BGFX_SYMBOL_IMPORT __declspec ( dllimport )

const BGFX_C_API = BGFX_SHARED_LIB_API

# Skipping MacroDefinition: BGFX_HANDLE_IS_VALID ( h ) ( ( h ) . idx != UINT16_MAX )

@cenum bgfx_fatal::UInt32 begin
    BGFX_FATAL_DEBUG_CHECK = 0
    BGFX_FATAL_INVALID_SHADER = 1
    BGFX_FATAL_UNABLE_TO_INITIALIZE = 2
    BGFX_FATAL_UNABLE_TO_CREATE_TEXTURE = 3
    BGFX_FATAL_DEVICE_LOST = 4
    BGFX_FATAL_COUNT = 5
end


const bgfx_fatal_t = bgfx_fatal

@cenum bgfx_renderer_type::UInt32 begin
    BGFX_RENDERER_TYPE_NOOP = 0
    BGFX_RENDERER_TYPE_DIRECT3D9 = 1
    BGFX_RENDERER_TYPE_DIRECT3D11 = 2
    BGFX_RENDERER_TYPE_DIRECT3D12 = 3
    BGFX_RENDERER_TYPE_GNM = 4
    BGFX_RENDERER_TYPE_METAL = 5
    BGFX_RENDERER_TYPE_NVN = 6
    BGFX_RENDERER_TYPE_OPENGLES = 7
    BGFX_RENDERER_TYPE_OPENGL = 8
    BGFX_RENDERER_TYPE_VULKAN = 9
    BGFX_RENDERER_TYPE_WEBGPU = 10
    BGFX_RENDERER_TYPE_COUNT = 11
end


const bgfx_renderer_type_t = bgfx_renderer_type

@cenum bgfx_access::UInt32 begin
    BGFX_ACCESS_READ = 0
    BGFX_ACCESS_WRITE = 1
    BGFX_ACCESS_READWRITE = 2
    BGFX_ACCESS_COUNT = 3
end


const bgfx_access_t = bgfx_access

@cenum bgfx_attrib::UInt32 begin
    BGFX_ATTRIB_POSITION = 0
    BGFX_ATTRIB_NORMAL = 1
    BGFX_ATTRIB_TANGENT = 2
    BGFX_ATTRIB_BITANGENT = 3
    BGFX_ATTRIB_COLOR0 = 4
    BGFX_ATTRIB_COLOR1 = 5
    BGFX_ATTRIB_COLOR2 = 6
    BGFX_ATTRIB_COLOR3 = 7
    BGFX_ATTRIB_INDICES = 8
    BGFX_ATTRIB_WEIGHT = 9
    BGFX_ATTRIB_TEXCOORD0 = 10
    BGFX_ATTRIB_TEXCOORD1 = 11
    BGFX_ATTRIB_TEXCOORD2 = 12
    BGFX_ATTRIB_TEXCOORD3 = 13
    BGFX_ATTRIB_TEXCOORD4 = 14
    BGFX_ATTRIB_TEXCOORD5 = 15
    BGFX_ATTRIB_TEXCOORD6 = 16
    BGFX_ATTRIB_TEXCOORD7 = 17
    BGFX_ATTRIB_COUNT = 18
end


const bgfx_attrib_t = bgfx_attrib

@cenum bgfx_attrib_type::UInt32 begin
    BGFX_ATTRIB_TYPE_UINT8 = 0
    BGFX_ATTRIB_TYPE_UINT10 = 1
    BGFX_ATTRIB_TYPE_INT16 = 2
    BGFX_ATTRIB_TYPE_HALF = 3
    BGFX_ATTRIB_TYPE_FLOAT = 4
    BGFX_ATTRIB_TYPE_COUNT = 5
end


const bgfx_attrib_type_t = bgfx_attrib_type

@cenum bgfx_texture_format::UInt32 begin
    BGFX_TEXTURE_FORMAT_BC1 = 0
    BGFX_TEXTURE_FORMAT_BC2 = 1
    BGFX_TEXTURE_FORMAT_BC3 = 2
    BGFX_TEXTURE_FORMAT_BC4 = 3
    BGFX_TEXTURE_FORMAT_BC5 = 4
    BGFX_TEXTURE_FORMAT_BC6H = 5
    BGFX_TEXTURE_FORMAT_BC7 = 6
    BGFX_TEXTURE_FORMAT_ETC1 = 7
    BGFX_TEXTURE_FORMAT_ETC2 = 8
    BGFX_TEXTURE_FORMAT_ETC2A = 9
    BGFX_TEXTURE_FORMAT_ETC2A1 = 10
    BGFX_TEXTURE_FORMAT_PTC12 = 11
    BGFX_TEXTURE_FORMAT_PTC14 = 12
    BGFX_TEXTURE_FORMAT_PTC12A = 13
    BGFX_TEXTURE_FORMAT_PTC14A = 14
    BGFX_TEXTURE_FORMAT_PTC22 = 15
    BGFX_TEXTURE_FORMAT_PTC24 = 16
    BGFX_TEXTURE_FORMAT_ATC = 17
    BGFX_TEXTURE_FORMAT_ATCE = 18
    BGFX_TEXTURE_FORMAT_ATCI = 19
    BGFX_TEXTURE_FORMAT_ASTC4X4 = 20
    BGFX_TEXTURE_FORMAT_ASTC5X5 = 21
    BGFX_TEXTURE_FORMAT_ASTC6X6 = 22
    BGFX_TEXTURE_FORMAT_ASTC8X5 = 23
    BGFX_TEXTURE_FORMAT_ASTC8X6 = 24
    BGFX_TEXTURE_FORMAT_ASTC10X5 = 25
    BGFX_TEXTURE_FORMAT_UNKNOWN = 26
    BGFX_TEXTURE_FORMAT_R1 = 27
    BGFX_TEXTURE_FORMAT_A8 = 28
    BGFX_TEXTURE_FORMAT_R8 = 29
    BGFX_TEXTURE_FORMAT_R8I = 30
    BGFX_TEXTURE_FORMAT_R8U = 31
    BGFX_TEXTURE_FORMAT_R8S = 32
    BGFX_TEXTURE_FORMAT_R16 = 33
    BGFX_TEXTURE_FORMAT_R16I = 34
    BGFX_TEXTURE_FORMAT_R16U = 35
    BGFX_TEXTURE_FORMAT_R16F = 36
    BGFX_TEXTURE_FORMAT_R16S = 37
    BGFX_TEXTURE_FORMAT_R32I = 38
    BGFX_TEXTURE_FORMAT_R32U = 39
    BGFX_TEXTURE_FORMAT_R32F = 40
    BGFX_TEXTURE_FORMAT_RG8 = 41
    BGFX_TEXTURE_FORMAT_RG8I = 42
    BGFX_TEXTURE_FORMAT_RG8U = 43
    BGFX_TEXTURE_FORMAT_RG8S = 44
    BGFX_TEXTURE_FORMAT_RG16 = 45
    BGFX_TEXTURE_FORMAT_RG16I = 46
    BGFX_TEXTURE_FORMAT_RG16U = 47
    BGFX_TEXTURE_FORMAT_RG16F = 48
    BGFX_TEXTURE_FORMAT_RG16S = 49
    BGFX_TEXTURE_FORMAT_RG32I = 50
    BGFX_TEXTURE_FORMAT_RG32U = 51
    BGFX_TEXTURE_FORMAT_RG32F = 52
    BGFX_TEXTURE_FORMAT_RGB8 = 53
    BGFX_TEXTURE_FORMAT_RGB8I = 54
    BGFX_TEXTURE_FORMAT_RGB8U = 55
    BGFX_TEXTURE_FORMAT_RGB8S = 56
    BGFX_TEXTURE_FORMAT_RGB9E5F = 57
    BGFX_TEXTURE_FORMAT_BGRA8 = 58
    BGFX_TEXTURE_FORMAT_RGBA8 = 59
    BGFX_TEXTURE_FORMAT_RGBA8I = 60
    BGFX_TEXTURE_FORMAT_RGBA8U = 61
    BGFX_TEXTURE_FORMAT_RGBA8S = 62
    BGFX_TEXTURE_FORMAT_RGBA16 = 63
    BGFX_TEXTURE_FORMAT_RGBA16I = 64
    BGFX_TEXTURE_FORMAT_RGBA16U = 65
    BGFX_TEXTURE_FORMAT_RGBA16F = 66
    BGFX_TEXTURE_FORMAT_RGBA16S = 67
    BGFX_TEXTURE_FORMAT_RGBA32I = 68
    BGFX_TEXTURE_FORMAT_RGBA32U = 69
    BGFX_TEXTURE_FORMAT_RGBA32F = 70
    BGFX_TEXTURE_FORMAT_R5G6B5 = 71
    BGFX_TEXTURE_FORMAT_RGBA4 = 72
    BGFX_TEXTURE_FORMAT_RGB5A1 = 73
    BGFX_TEXTURE_FORMAT_RGB10A2 = 74
    BGFX_TEXTURE_FORMAT_RG11B10F = 75
    BGFX_TEXTURE_FORMAT_UNKNOWNDEPTH = 76
    BGFX_TEXTURE_FORMAT_D16 = 77
    BGFX_TEXTURE_FORMAT_D24 = 78
    BGFX_TEXTURE_FORMAT_D24S8 = 79
    BGFX_TEXTURE_FORMAT_D32 = 80
    BGFX_TEXTURE_FORMAT_D16F = 81
    BGFX_TEXTURE_FORMAT_D24F = 82
    BGFX_TEXTURE_FORMAT_D32F = 83
    BGFX_TEXTURE_FORMAT_D0S8 = 84
    BGFX_TEXTURE_FORMAT_COUNT = 85
end


const bgfx_texture_format_t = bgfx_texture_format

@cenum bgfx_uniform_type::UInt32 begin
    BGFX_UNIFORM_TYPE_SAMPLER = 0
    BGFX_UNIFORM_TYPE_END = 1
    BGFX_UNIFORM_TYPE_VEC4 = 2
    BGFX_UNIFORM_TYPE_MAT3 = 3
    BGFX_UNIFORM_TYPE_MAT4 = 4
    BGFX_UNIFORM_TYPE_COUNT = 5
end


const bgfx_uniform_type_t = bgfx_uniform_type

@cenum bgfx_backbuffer_ratio::UInt32 begin
    BGFX_BACKBUFFER_RATIO_EQUAL = 0
    BGFX_BACKBUFFER_RATIO_HALF = 1
    BGFX_BACKBUFFER_RATIO_QUARTER = 2
    BGFX_BACKBUFFER_RATIO_EIGHTH = 3
    BGFX_BACKBUFFER_RATIO_SIXTEENTH = 4
    BGFX_BACKBUFFER_RATIO_DOUBLE = 5
    BGFX_BACKBUFFER_RATIO_COUNT = 6
end


const bgfx_backbuffer_ratio_t = bgfx_backbuffer_ratio

@cenum bgfx_occlusion_query_result::UInt32 begin
    BGFX_OCCLUSION_QUERY_RESULT_INVISIBLE = 0
    BGFX_OCCLUSION_QUERY_RESULT_VISIBLE = 1
    BGFX_OCCLUSION_QUERY_RESULT_NORESULT = 2
    BGFX_OCCLUSION_QUERY_RESULT_COUNT = 3
end


const bgfx_occlusion_query_result_t = bgfx_occlusion_query_result

@cenum bgfx_topology::UInt32 begin
    BGFX_TOPOLOGY_TRI_LIST = 0
    BGFX_TOPOLOGY_TRI_STRIP = 1
    BGFX_TOPOLOGY_LINE_LIST = 2
    BGFX_TOPOLOGY_LINE_STRIP = 3
    BGFX_TOPOLOGY_POINT_LIST = 4
    BGFX_TOPOLOGY_COUNT = 5
end


const bgfx_topology_t = bgfx_topology

@cenum bgfx_topology_convert::UInt32 begin
    BGFX_TOPOLOGY_CONVERT_TRI_LIST_FLIP_WINDING = 0
    BGFX_TOPOLOGY_CONVERT_TRI_STRIP_FLIP_WINDING = 1
    BGFX_TOPOLOGY_CONVERT_TRI_LIST_TO_LINE_LIST = 2
    BGFX_TOPOLOGY_CONVERT_TRI_STRIP_TO_TRI_LIST = 3
    BGFX_TOPOLOGY_CONVERT_LINE_STRIP_TO_LINE_LIST = 4
    BGFX_TOPOLOGY_CONVERT_COUNT = 5
end


const bgfx_topology_convert_t = bgfx_topology_convert

@cenum bgfx_topology_sort::UInt32 begin
    BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_MIN = 0
    BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_AVG = 1
    BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_MAX = 2
    BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_MIN = 3
    BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_AVG = 4
    BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_MAX = 5
    BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_MIN = 6
    BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_AVG = 7
    BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_MAX = 8
    BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_MIN = 9
    BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_AVG = 10
    BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_MAX = 11
    BGFX_TOPOLOGY_SORT_COUNT = 12
end


const bgfx_topology_sort_t = bgfx_topology_sort

@cenum bgfx_view_mode::UInt32 begin
    BGFX_VIEW_MODE_DEFAULT = 0
    BGFX_VIEW_MODE_SEQUENTIAL = 1
    BGFX_VIEW_MODE_DEPTH_ASCENDING = 2
    BGFX_VIEW_MODE_DEPTH_DESCENDING = 3
    BGFX_VIEW_MODE_COUNT = 4
end


const bgfx_view_mode_t = bgfx_view_mode

@cenum bgfx_render_frame::UInt32 begin
    BGFX_RENDER_FRAME_NO_CONTEXT = 0
    BGFX_RENDER_FRAME_RENDER = 1
    BGFX_RENDER_FRAME_TIMEOUT = 2
    BGFX_RENDER_FRAME_EXITING = 3
    BGFX_RENDER_FRAME_COUNT = 4
end


const bgfx_render_frame_t = bgfx_render_frame
const bgfx_view_id_t = UInt16

struct bgfx_allocator_vtbl_s
    realloc::Ptr{Cvoid}
end

struct bgfx_allocator_interface_s
    vtbl::Ptr{bgfx_allocator_vtbl_s}
end

const bgfx_allocator_interface_t = bgfx_allocator_interface_s
const bgfx_allocator_vtbl_t = bgfx_allocator_vtbl_s

struct bgfx_interface_vtbl
    attachment_init::Ptr{Cvoid}
    vertex_layout_begin::Ptr{Cvoid}
    vertex_layout_add::Ptr{Cvoid}
    vertex_layout_decode::Ptr{Cvoid}
    vertex_layout_has::Ptr{Cvoid}
    vertex_layout_skip::Ptr{Cvoid}
    vertex_layout_end::Ptr{Cvoid}
    vertex_pack::Ptr{Cvoid}
    vertex_unpack::Ptr{Cvoid}
    vertex_convert::Ptr{Cvoid}
    weld_vertices::Ptr{Cvoid}
    topology_convert::Ptr{Cvoid}
    topology_sort_tri_list::Ptr{Cvoid}
    get_supported_renderers::Ptr{Cvoid}
    get_renderer_name::Ptr{Cvoid}
    init_ctor::Ptr{Cvoid}
    init::Ptr{Cvoid}
    shutdown::Ptr{Cvoid}
    reset::Ptr{Cvoid}
    frame::Ptr{Cvoid}
    get_renderer_type::Ptr{Cvoid}
    get_caps::Ptr{Cvoid}
    get_stats::Ptr{Cvoid}
    alloc::Ptr{Cvoid}
    copy::Ptr{Cvoid}
    make_ref::Ptr{Cvoid}
    make_ref_release::Ptr{Cvoid}
    set_debug::Ptr{Cvoid}
    dbg_text_clear::Ptr{Cvoid}
    dbg_text_printf::Ptr{Cvoid}
    dbg_text_vprintf::Ptr{Cvoid}
    dbg_text_image::Ptr{Cvoid}
    create_index_buffer::Ptr{Cvoid}
    set_index_buffer_name::Ptr{Cvoid}
    destroy_index_buffer::Ptr{Cvoid}
    create_vertex_layout::Ptr{Cvoid}
    destroy_vertex_layout::Ptr{Cvoid}
    create_vertex_buffer::Ptr{Cvoid}
    set_vertex_buffer_name::Ptr{Cvoid}
    destroy_vertex_buffer::Ptr{Cvoid}
    create_dynamic_index_buffer::Ptr{Cvoid}
    create_dynamic_index_buffer_mem::Ptr{Cvoid}
    update_dynamic_index_buffer::Ptr{Cvoid}
    destroy_dynamic_index_buffer::Ptr{Cvoid}
    create_dynamic_vertex_buffer::Ptr{Cvoid}
    create_dynamic_vertex_buffer_mem::Ptr{Cvoid}
    update_dynamic_vertex_buffer::Ptr{Cvoid}
    destroy_dynamic_vertex_buffer::Ptr{Cvoid}
    get_avail_transient_index_buffer::Ptr{Cvoid}
    get_avail_transient_vertex_buffer::Ptr{Cvoid}
    get_avail_instance_data_buffer::Ptr{Cvoid}
    alloc_transient_index_buffer::Ptr{Cvoid}
    alloc_transient_vertex_buffer::Ptr{Cvoid}
    alloc_transient_buffers::Ptr{Cvoid}
    alloc_instance_data_buffer::Ptr{Cvoid}
    create_indirect_buffer::Ptr{Cvoid}
    destroy_indirect_buffer::Ptr{Cvoid}
    create_shader::Ptr{Cvoid}
    get_shader_uniforms::Ptr{Cvoid}
    set_shader_name::Ptr{Cvoid}
    destroy_shader::Ptr{Cvoid}
    create_program::Ptr{Cvoid}
    create_compute_program::Ptr{Cvoid}
    destroy_program::Ptr{Cvoid}
    is_texture_valid::Ptr{Cvoid}
    calc_texture_size::Ptr{Cvoid}
    create_texture::Ptr{Cvoid}
    create_texture_2d::Ptr{Cvoid}
    create_texture_2d_scaled::Ptr{Cvoid}
    create_texture_3d::Ptr{Cvoid}
    create_texture_cube::Ptr{Cvoid}
    update_texture_2d::Ptr{Cvoid}
    update_texture_3d::Ptr{Cvoid}
    update_texture_cube::Ptr{Cvoid}
    read_texture::Ptr{Cvoid}
    set_texture_name::Ptr{Cvoid}
    get_direct_access_ptr::Ptr{Cvoid}
    destroy_texture::Ptr{Cvoid}
    create_frame_buffer::Ptr{Cvoid}
    create_frame_buffer_scaled::Ptr{Cvoid}
    create_frame_buffer_from_handles::Ptr{Cvoid}
    create_frame_buffer_from_attachment::Ptr{Cvoid}
    create_frame_buffer_from_nwh::Ptr{Cvoid}
    set_frame_buffer_name::Ptr{Cvoid}
    get_texture::Ptr{Cvoid}
    destroy_frame_buffer::Ptr{Cvoid}
    create_uniform::Ptr{Cvoid}
    get_uniform_info::Ptr{Cvoid}
    destroy_uniform::Ptr{Cvoid}
    create_occlusion_query::Ptr{Cvoid}
    get_result::Ptr{Cvoid}
    destroy_occlusion_query::Ptr{Cvoid}
    set_palette_color::Ptr{Cvoid}
    set_palette_color_rgba8::Ptr{Cvoid}
    set_view_name::Ptr{Cvoid}
    set_view_rect::Ptr{Cvoid}
    set_view_rect_ratio::Ptr{Cvoid}
    set_view_scissor::Ptr{Cvoid}
    set_view_clear::Ptr{Cvoid}
    set_view_clear_mrt::Ptr{Cvoid}
    set_view_mode::Ptr{Cvoid}
    set_view_frame_buffer::Ptr{Cvoid}
    set_view_transform::Ptr{Cvoid}
    set_view_order::Ptr{Cvoid}
    reset_view::Ptr{Cvoid}
    encoder_begin::Ptr{Cvoid}
    encoder_end::Ptr{Cvoid}
    encoder_set_marker::Ptr{Cvoid}
    encoder_set_state::Ptr{Cvoid}
    encoder_set_condition::Ptr{Cvoid}
    encoder_set_stencil::Ptr{Cvoid}
    encoder_set_scissor::Ptr{Cvoid}
    encoder_set_scissor_cached::Ptr{Cvoid}
    encoder_set_transform::Ptr{Cvoid}
    encoder_set_transform_cached::Ptr{Cvoid}
    encoder_alloc_transform::Ptr{Cvoid}
    encoder_set_uniform::Ptr{Cvoid}
    encoder_set_index_buffer::Ptr{Cvoid}
    encoder_set_dynamic_index_buffer::Ptr{Cvoid}
    encoder_set_transient_index_buffer::Ptr{Cvoid}
    encoder_set_vertex_buffer::Ptr{Cvoid}
    encoder_set_vertex_buffer_with_layout::Ptr{Cvoid}
    encoder_set_dynamic_vertex_buffer::Ptr{Cvoid}
    encoder_set_dynamic_vertex_buffer_with_layout::Ptr{Cvoid}
    encoder_set_transient_vertex_buffer::Ptr{Cvoid}
    encoder_set_transient_vertex_buffer_with_layout::Ptr{Cvoid}
    encoder_set_vertex_count::Ptr{Cvoid}
    encoder_set_instance_data_buffer::Ptr{Cvoid}
    encoder_set_instance_data_from_vertex_buffer::Ptr{Cvoid}
    encoder_set_instance_data_from_dynamic_vertex_buffer::Ptr{Cvoid}
    encoder_set_instance_count::Ptr{Cvoid}
    encoder_set_texture::Ptr{Cvoid}
    encoder_touch::Ptr{Cvoid}
    encoder_submit::Ptr{Cvoid}
    encoder_submit_occlusion_query::Ptr{Cvoid}
    encoder_submit_indirect::Ptr{Cvoid}
    encoder_set_compute_index_buffer::Ptr{Cvoid}
    encoder_set_compute_vertex_buffer::Ptr{Cvoid}
    encoder_set_compute_dynamic_index_buffer::Ptr{Cvoid}
    encoder_set_compute_dynamic_vertex_buffer::Ptr{Cvoid}
    encoder_set_compute_indirect_buffer::Ptr{Cvoid}
    encoder_set_image::Ptr{Cvoid}
    encoder_dispatch::Ptr{Cvoid}
    encoder_dispatch_indirect::Ptr{Cvoid}
    encoder_discard::Ptr{Cvoid}
    encoder_blit::Ptr{Cvoid}
    request_screen_shot::Ptr{Cvoid}
    render_frame::Ptr{Cvoid}
    set_platform_data::Ptr{Cvoid}
    get_internal_data::Ptr{Cvoid}
    override_internal_texture_ptr::Ptr{Cvoid}
    override_internal_texture::Ptr{Cvoid}
    set_marker::Ptr{Cvoid}
    set_state::Ptr{Cvoid}
    set_condition::Ptr{Cvoid}
    set_stencil::Ptr{Cvoid}
    set_scissor::Ptr{Cvoid}
    set_scissor_cached::Ptr{Cvoid}
    set_transform::Ptr{Cvoid}
    set_transform_cached::Ptr{Cvoid}
    alloc_transform::Ptr{Cvoid}
    set_uniform::Ptr{Cvoid}
    set_index_buffer::Ptr{Cvoid}
    set_dynamic_index_buffer::Ptr{Cvoid}
    set_transient_index_buffer::Ptr{Cvoid}
    set_vertex_buffer::Ptr{Cvoid}
    set_vertex_buffer_with_layout::Ptr{Cvoid}
    set_dynamic_vertex_buffer::Ptr{Cvoid}
    set_dynamic_vertex_buffer_with_layout::Ptr{Cvoid}
    set_transient_vertex_buffer::Ptr{Cvoid}
    set_transient_vertex_buffer_with_layout::Ptr{Cvoid}
    set_vertex_count::Ptr{Cvoid}
    set_instance_data_buffer::Ptr{Cvoid}
    set_instance_data_from_vertex_buffer::Ptr{Cvoid}
    set_instance_data_from_dynamic_vertex_buffer::Ptr{Cvoid}
    set_instance_count::Ptr{Cvoid}
    set_texture::Ptr{Cvoid}
    touch::Ptr{Cvoid}
    submit::Ptr{Cvoid}
    submit_occlusion_query::Ptr{Cvoid}
    submit_indirect::Ptr{Cvoid}
    set_compute_index_buffer::Ptr{Cvoid}
    set_compute_vertex_buffer::Ptr{Cvoid}
    set_compute_dynamic_index_buffer::Ptr{Cvoid}
    set_compute_dynamic_vertex_buffer::Ptr{Cvoid}
    set_compute_indirect_buffer::Ptr{Cvoid}
    set_image::Ptr{Cvoid}
    dispatch::Ptr{Cvoid}
    dispatch_indirect::Ptr{Cvoid}
    discard::Ptr{Cvoid}
    blit::Ptr{Cvoid}
end

const bgfx_interface_vtbl_t = bgfx_interface_vtbl

struct bgfx_callback_vtbl_s
    fatal::Ptr{Cvoid}
    trace_vargs::Ptr{Cvoid}
    profiler_begin::Ptr{Cvoid}
    profiler_begin_literal::Ptr{Cvoid}
    profiler_end::Ptr{Cvoid}
    cache_read_size::Ptr{Cvoid}
    cache_read::Ptr{Cvoid}
    cache_write::Ptr{Cvoid}
    screen_shot::Ptr{Cvoid}
    capture_begin::Ptr{Cvoid}
    capture_end::Ptr{Cvoid}
    capture_frame::Ptr{Cvoid}
end

struct bgfx_callback_interface_s
    vtbl::Ptr{bgfx_callback_vtbl_s}
end

const bgfx_callback_interface_t = bgfx_callback_interface_s
const bgfx_callback_vtbl_t = bgfx_callback_vtbl_s

struct bgfx_dynamic_index_buffer_handle_s
    idx::UInt16
end

const bgfx_dynamic_index_buffer_handle_t = bgfx_dynamic_index_buffer_handle_s

struct bgfx_dynamic_vertex_buffer_handle_s
    idx::UInt16
end

const bgfx_dynamic_vertex_buffer_handle_t = bgfx_dynamic_vertex_buffer_handle_s

struct bgfx_frame_buffer_handle_s
    idx::UInt16
end

const bgfx_frame_buffer_handle_t = bgfx_frame_buffer_handle_s

struct bgfx_index_buffer_handle_s
    idx::UInt16
end

const bgfx_index_buffer_handle_t = bgfx_index_buffer_handle_s

struct bgfx_indirect_buffer_handle_s
    idx::UInt16
end

const bgfx_indirect_buffer_handle_t = bgfx_indirect_buffer_handle_s

struct bgfx_occlusion_query_handle_s
    idx::UInt16
end

const bgfx_occlusion_query_handle_t = bgfx_occlusion_query_handle_s

struct bgfx_program_handle_s
    idx::UInt16
end

const bgfx_program_handle_t = bgfx_program_handle_s

struct bgfx_shader_handle_s
    idx::UInt16
end

const bgfx_shader_handle_t = bgfx_shader_handle_s

struct bgfx_texture_handle_s
    idx::UInt16
end

const bgfx_texture_handle_t = bgfx_texture_handle_s

struct bgfx_uniform_handle_s
    idx::UInt16
end

const bgfx_uniform_handle_t = bgfx_uniform_handle_s

struct bgfx_vertex_buffer_handle_s
    idx::UInt16
end

const bgfx_vertex_buffer_handle_t = bgfx_vertex_buffer_handle_s

struct bgfx_vertex_layout_handle_s
    idx::UInt16
end

const bgfx_vertex_layout_handle_t = bgfx_vertex_layout_handle_s
const bgfx_release_fn_t = Ptr{Cvoid}

struct bgfx_caps_gpu_s
    vendorId::UInt16
    deviceId::UInt16
end

const bgfx_caps_gpu_t = bgfx_caps_gpu_s

struct bgfx_caps_limits_s
    maxDrawCalls::UInt32
    maxBlits::UInt32
    maxTextureSize::UInt32
    maxTextureLayers::UInt32
    maxViews::UInt32
    maxFrameBuffers::UInt32
    maxFBAttachments::UInt32
    maxPrograms::UInt32
    maxShaders::UInt32
    maxTextures::UInt32
    maxTextureSamplers::UInt32
    maxComputeBindings::UInt32
    maxVertexLayouts::UInt32
    maxVertexStreams::UInt32
    maxIndexBuffers::UInt32
    maxVertexBuffers::UInt32
    maxDynamicIndexBuffers::UInt32
    maxDynamicVertexBuffers::UInt32
    maxUniforms::UInt32
    maxOcclusionQueries::UInt32
    maxEncoders::UInt32
    minResourceCbSize::UInt32
    transientVbSize::UInt32
    transientIbSize::UInt32
end

const bgfx_caps_limits_t = bgfx_caps_limits_s

struct bgfx_caps_s
    rendererType::bgfx_renderer_type_t
    supported::UInt64
    vendorId::UInt16
    deviceId::UInt16
    homogeneousDepth::Bool
    originBottomLeft::Bool
    numGPUs::UInt8
    gpu::NTuple{4, bgfx_caps_gpu_t}
    limits::bgfx_caps_limits_t
    formats::NTuple{85, UInt16}
end

const bgfx_caps_t = bgfx_caps_s

struct bgfx_internal_data_s
    caps::Ptr{bgfx_caps_t}
    context::Ptr{Cvoid}
end

const bgfx_internal_data_t = bgfx_internal_data_s

struct bgfx_platform_data_s
    ndt::Ptr{Cvoid}
    nwh::Ptr{Cvoid}
    context::Ptr{Cvoid}
    backBuffer::Ptr{Cvoid}
    backBufferDS::Ptr{Cvoid}
end

const bgfx_platform_data_t = bgfx_platform_data_s

struct bgfx_resolution_s
    format::bgfx_texture_format_t
    width::UInt32
    height::UInt32
    reset::UInt32
    numBackBuffers::UInt8
    maxFrameLatency::UInt8
end

const bgfx_resolution_t = bgfx_resolution_s

struct bgfx_init_limits_s
    maxEncoders::UInt16
    minResourceCbSize::UInt32
    transientVbSize::UInt32
    transientIbSize::UInt32
end

const bgfx_init_limits_t = bgfx_init_limits_s

struct bgfx_init_s
    type::bgfx_renderer_type_t
    vendorId::UInt16
    deviceId::UInt16
    debug::Bool
    profile::Bool
    platformData::bgfx_platform_data_t
    resolution::bgfx_resolution_t
    limits::bgfx_init_limits_t
    callback::Ptr{bgfx_callback_interface_t}
    allocator::Ptr{bgfx_allocator_interface_t}
end

const bgfx_init_t = bgfx_init_s

struct bgfx_memory_s
    data::Ptr{UInt8}
    size::UInt32
end

const bgfx_memory_t = bgfx_memory_s

struct bgfx_transient_index_buffer_s
    data::Ptr{UInt8}
    size::UInt32
    startIndex::UInt32
    handle::bgfx_index_buffer_handle_t
end

const bgfx_transient_index_buffer_t = bgfx_transient_index_buffer_s

struct bgfx_transient_vertex_buffer_s
    data::Ptr{UInt8}
    size::UInt32
    startVertex::UInt32
    stride::UInt16
    handle::bgfx_vertex_buffer_handle_t
    layoutHandle::bgfx_vertex_layout_handle_t
end

const bgfx_transient_vertex_buffer_t = bgfx_transient_vertex_buffer_s

struct bgfx_instance_data_buffer_s
    data::Ptr{UInt8}
    size::UInt32
    offset::UInt32
    num::UInt32
    stride::UInt16
    handle::bgfx_vertex_buffer_handle_t
end

const bgfx_instance_data_buffer_t = bgfx_instance_data_buffer_s

struct bgfx_texture_info_s
    format::bgfx_texture_format_t
    storageSize::UInt32
    width::UInt16
    height::UInt16
    depth::UInt16
    numLayers::UInt16
    numMips::UInt8
    bitsPerPixel::UInt8
    cubeMap::Bool
end

const bgfx_texture_info_t = bgfx_texture_info_s

struct bgfx_uniform_info_s
    name::NTuple{256, UInt8}
    type::bgfx_uniform_type_t
    num::UInt16
end

const bgfx_uniform_info_t = bgfx_uniform_info_s

struct bgfx_attachment_s
    access::bgfx_access_t
    handle::bgfx_texture_handle_t
    mip::UInt16
    layer::UInt16
    resolve::UInt8
end

const bgfx_attachment_t = bgfx_attachment_s

struct bgfx_transform_s
    data::Ptr{Cfloat}
    num::UInt16
end

const bgfx_transform_t = bgfx_transform_s

struct bgfx_view_stats_s
    name::NTuple{256, UInt8}
    view::bgfx_view_id_t
    cpuTimeBegin::Int64
    cpuTimeEnd::Int64
    gpuTimeBegin::Int64
    gpuTimeEnd::Int64
end

const bgfx_view_stats_t = bgfx_view_stats_s

struct bgfx_encoder_stats_s
    cpuTimeBegin::Int64
    cpuTimeEnd::Int64
end

const bgfx_encoder_stats_t = bgfx_encoder_stats_s

struct bgfx_stats_s
    cpuTimeFrame::Int64
    cpuTimeBegin::Int64
    cpuTimeEnd::Int64
    cpuTimerFreq::Int64
    gpuTimeBegin::Int64
    gpuTimeEnd::Int64
    gpuTimerFreq::Int64
    waitRender::Int64
    waitSubmit::Int64
    numDraw::UInt32
    numCompute::UInt32
    numBlit::UInt32
    maxGpuLatency::UInt32
    numDynamicIndexBuffers::UInt16
    numDynamicVertexBuffers::UInt16
    numFrameBuffers::UInt16
    numIndexBuffers::UInt16
    numOcclusionQueries::UInt16
    numPrograms::UInt16
    numShaders::UInt16
    numTextures::UInt16
    numUniforms::UInt16
    numVertexBuffers::UInt16
    numVertexLayouts::UInt16
    textureMemoryUsed::Int64
    rtMemoryUsed::Int64
    transientVbUsed::Int32
    transientIbUsed::Int32
    numPrims::NTuple{5, UInt32}
    gpuMemoryMax::Int64
    gpuMemoryUsed::Int64
    width::UInt16
    height::UInt16
    textWidth::UInt16
    textHeight::UInt16
    numViews::UInt16
    viewStats::Ptr{bgfx_view_stats_t}
    numEncoders::UInt8
    encoderStats::Ptr{bgfx_encoder_stats_t}
end

const bgfx_stats_t = bgfx_stats_s

struct bgfx_vertex_layout_s
    hash::UInt32
    stride::UInt16
    offset::NTuple{18, UInt16}
    attributes::NTuple{18, UInt16}
end

const bgfx_vertex_layout_t = bgfx_vertex_layout_s
const bgfx_encoder_s = Cvoid
const bgfx_encoder_t = bgfx_encoder_s

@cenum bgfx_function_id::UInt32 begin
    BGFX_FUNCTION_ID_ATTACHMENT_INIT = 0
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_BEGIN = 1
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_ADD = 2
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_DECODE = 3
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_HAS = 4
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_SKIP = 5
    BGFX_FUNCTION_ID_VERTEX_LAYOUT_END = 6
    BGFX_FUNCTION_ID_VERTEX_PACK = 7
    BGFX_FUNCTION_ID_VERTEX_UNPACK = 8
    BGFX_FUNCTION_ID_VERTEX_CONVERT = 9
    BGFX_FUNCTION_ID_WELD_VERTICES = 10
    BGFX_FUNCTION_ID_TOPOLOGY_CONVERT = 11
    BGFX_FUNCTION_ID_TOPOLOGY_SORT_TRI_LIST = 12
    BGFX_FUNCTION_ID_GET_SUPPORTED_RENDERERS = 13
    BGFX_FUNCTION_ID_GET_RENDERER_NAME = 14
    BGFX_FUNCTION_ID_INIT_CTOR = 15
    BGFX_FUNCTION_ID_INIT = 16
    BGFX_FUNCTION_ID_SHUTDOWN = 17
    BGFX_FUNCTION_ID_RESET = 18
    BGFX_FUNCTION_ID_FRAME = 19
    BGFX_FUNCTION_ID_GET_RENDERER_TYPE = 20
    BGFX_FUNCTION_ID_GET_CAPS = 21
    BGFX_FUNCTION_ID_GET_STATS = 22
    BGFX_FUNCTION_ID_ALLOC = 23
    BGFX_FUNCTION_ID_COPY = 24
    BGFX_FUNCTION_ID_MAKE_REF = 25
    BGFX_FUNCTION_ID_MAKE_REF_RELEASE = 26
    BGFX_FUNCTION_ID_SET_DEBUG = 27
    BGFX_FUNCTION_ID_DBG_TEXT_CLEAR = 28
    BGFX_FUNCTION_ID_DBG_TEXT_PRINTF = 29
    BGFX_FUNCTION_ID_DBG_TEXT_VPRINTF = 30
    BGFX_FUNCTION_ID_DBG_TEXT_IMAGE = 31
    BGFX_FUNCTION_ID_CREATE_INDEX_BUFFER = 32
    BGFX_FUNCTION_ID_SET_INDEX_BUFFER_NAME = 33
    BGFX_FUNCTION_ID_DESTROY_INDEX_BUFFER = 34
    BGFX_FUNCTION_ID_CREATE_VERTEX_LAYOUT = 35
    BGFX_FUNCTION_ID_DESTROY_VERTEX_LAYOUT = 36
    BGFX_FUNCTION_ID_CREATE_VERTEX_BUFFER = 37
    BGFX_FUNCTION_ID_SET_VERTEX_BUFFER_NAME = 38
    BGFX_FUNCTION_ID_DESTROY_VERTEX_BUFFER = 39
    BGFX_FUNCTION_ID_CREATE_DYNAMIC_INDEX_BUFFER = 40
    BGFX_FUNCTION_ID_CREATE_DYNAMIC_INDEX_BUFFER_MEM = 41
    BGFX_FUNCTION_ID_UPDATE_DYNAMIC_INDEX_BUFFER = 42
    BGFX_FUNCTION_ID_DESTROY_DYNAMIC_INDEX_BUFFER = 43
    BGFX_FUNCTION_ID_CREATE_DYNAMIC_VERTEX_BUFFER = 44
    BGFX_FUNCTION_ID_CREATE_DYNAMIC_VERTEX_BUFFER_MEM = 45
    BGFX_FUNCTION_ID_UPDATE_DYNAMIC_VERTEX_BUFFER = 46
    BGFX_FUNCTION_ID_DESTROY_DYNAMIC_VERTEX_BUFFER = 47
    BGFX_FUNCTION_ID_GET_AVAIL_TRANSIENT_INDEX_BUFFER = 48
    BGFX_FUNCTION_ID_GET_AVAIL_TRANSIENT_VERTEX_BUFFER = 49
    BGFX_FUNCTION_ID_GET_AVAIL_INSTANCE_DATA_BUFFER = 50
    BGFX_FUNCTION_ID_ALLOC_TRANSIENT_INDEX_BUFFER = 51
    BGFX_FUNCTION_ID_ALLOC_TRANSIENT_VERTEX_BUFFER = 52
    BGFX_FUNCTION_ID_ALLOC_TRANSIENT_BUFFERS = 53
    BGFX_FUNCTION_ID_ALLOC_INSTANCE_DATA_BUFFER = 54
    BGFX_FUNCTION_ID_CREATE_INDIRECT_BUFFER = 55
    BGFX_FUNCTION_ID_DESTROY_INDIRECT_BUFFER = 56
    BGFX_FUNCTION_ID_CREATE_SHADER = 57
    BGFX_FUNCTION_ID_GET_SHADER_UNIFORMS = 58
    BGFX_FUNCTION_ID_SET_SHADER_NAME = 59
    BGFX_FUNCTION_ID_DESTROY_SHADER = 60
    BGFX_FUNCTION_ID_CREATE_PROGRAM = 61
    BGFX_FUNCTION_ID_CREATE_COMPUTE_PROGRAM = 62
    BGFX_FUNCTION_ID_DESTROY_PROGRAM = 63
    BGFX_FUNCTION_ID_IS_TEXTURE_VALID = 64
    BGFX_FUNCTION_ID_CALC_TEXTURE_SIZE = 65
    BGFX_FUNCTION_ID_CREATE_TEXTURE = 66
    BGFX_FUNCTION_ID_CREATE_TEXTURE_2D = 67
    BGFX_FUNCTION_ID_CREATE_TEXTURE_2D_SCALED = 68
    BGFX_FUNCTION_ID_CREATE_TEXTURE_3D = 69
    BGFX_FUNCTION_ID_CREATE_TEXTURE_CUBE = 70
    BGFX_FUNCTION_ID_UPDATE_TEXTURE_2D = 71
    BGFX_FUNCTION_ID_UPDATE_TEXTURE_3D = 72
    BGFX_FUNCTION_ID_UPDATE_TEXTURE_CUBE = 73
    BGFX_FUNCTION_ID_READ_TEXTURE = 74
    BGFX_FUNCTION_ID_SET_TEXTURE_NAME = 75
    BGFX_FUNCTION_ID_GET_DIRECT_ACCESS_PTR = 76
    BGFX_FUNCTION_ID_DESTROY_TEXTURE = 77
    BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER = 78
    BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_SCALED = 79
    BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_HANDLES = 80
    BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_ATTACHMENT = 81
    BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_NWH = 82
    BGFX_FUNCTION_ID_SET_FRAME_BUFFER_NAME = 83
    BGFX_FUNCTION_ID_GET_TEXTURE = 84
    BGFX_FUNCTION_ID_DESTROY_FRAME_BUFFER = 85
    BGFX_FUNCTION_ID_CREATE_UNIFORM = 86
    BGFX_FUNCTION_ID_GET_UNIFORM_INFO = 87
    BGFX_FUNCTION_ID_DESTROY_UNIFORM = 88
    BGFX_FUNCTION_ID_CREATE_OCCLUSION_QUERY = 89
    BGFX_FUNCTION_ID_GET_RESULT = 90
    BGFX_FUNCTION_ID_DESTROY_OCCLUSION_QUERY = 91
    BGFX_FUNCTION_ID_SET_PALETTE_COLOR = 92
    BGFX_FUNCTION_ID_SET_PALETTE_COLOR_RGBA8 = 93
    BGFX_FUNCTION_ID_SET_VIEW_NAME = 94
    BGFX_FUNCTION_ID_SET_VIEW_RECT = 95
    BGFX_FUNCTION_ID_SET_VIEW_RECT_RATIO = 96
    BGFX_FUNCTION_ID_SET_VIEW_SCISSOR = 97
    BGFX_FUNCTION_ID_SET_VIEW_CLEAR = 98
    BGFX_FUNCTION_ID_SET_VIEW_CLEAR_MRT = 99
    BGFX_FUNCTION_ID_SET_VIEW_MODE = 100
    BGFX_FUNCTION_ID_SET_VIEW_FRAME_BUFFER = 101
    BGFX_FUNCTION_ID_SET_VIEW_TRANSFORM = 102
    BGFX_FUNCTION_ID_SET_VIEW_ORDER = 103
    BGFX_FUNCTION_ID_RESET_VIEW = 104
    BGFX_FUNCTION_ID_ENCODER_BEGIN = 105
    BGFX_FUNCTION_ID_ENCODER_END = 106
    BGFX_FUNCTION_ID_ENCODER_SET_MARKER = 107
    BGFX_FUNCTION_ID_ENCODER_SET_STATE = 108
    BGFX_FUNCTION_ID_ENCODER_SET_CONDITION = 109
    BGFX_FUNCTION_ID_ENCODER_SET_STENCIL = 110
    BGFX_FUNCTION_ID_ENCODER_SET_SCISSOR = 111
    BGFX_FUNCTION_ID_ENCODER_SET_SCISSOR_CACHED = 112
    BGFX_FUNCTION_ID_ENCODER_SET_TRANSFORM = 113
    BGFX_FUNCTION_ID_ENCODER_SET_TRANSFORM_CACHED = 114
    BGFX_FUNCTION_ID_ENCODER_ALLOC_TRANSFORM = 115
    BGFX_FUNCTION_ID_ENCODER_SET_UNIFORM = 116
    BGFX_FUNCTION_ID_ENCODER_SET_INDEX_BUFFER = 117
    BGFX_FUNCTION_ID_ENCODER_SET_DYNAMIC_INDEX_BUFFER = 118
    BGFX_FUNCTION_ID_ENCODER_SET_TRANSIENT_INDEX_BUFFER = 119
    BGFX_FUNCTION_ID_ENCODER_SET_VERTEX_BUFFER = 120
    BGFX_FUNCTION_ID_ENCODER_SET_VERTEX_BUFFER_WITH_LAYOUT = 121
    BGFX_FUNCTION_ID_ENCODER_SET_DYNAMIC_VERTEX_BUFFER = 122
    BGFX_FUNCTION_ID_ENCODER_SET_DYNAMIC_VERTEX_BUFFER_WITH_LAYOUT = 123
    BGFX_FUNCTION_ID_ENCODER_SET_TRANSIENT_VERTEX_BUFFER = 124
    BGFX_FUNCTION_ID_ENCODER_SET_TRANSIENT_VERTEX_BUFFER_WITH_LAYOUT = 125
    BGFX_FUNCTION_ID_ENCODER_SET_VERTEX_COUNT = 126
    BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_BUFFER = 127
    BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_FROM_VERTEX_BUFFER = 128
    BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_FROM_DYNAMIC_VERTEX_BUFFER = 129
    BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_COUNT = 130
    BGFX_FUNCTION_ID_ENCODER_SET_TEXTURE = 131
    BGFX_FUNCTION_ID_ENCODER_TOUCH = 132
    BGFX_FUNCTION_ID_ENCODER_SUBMIT = 133
    BGFX_FUNCTION_ID_ENCODER_SUBMIT_OCCLUSION_QUERY = 134
    BGFX_FUNCTION_ID_ENCODER_SUBMIT_INDIRECT = 135
    BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_INDEX_BUFFER = 136
    BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_VERTEX_BUFFER = 137
    BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_DYNAMIC_INDEX_BUFFER = 138
    BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_DYNAMIC_VERTEX_BUFFER = 139
    BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_INDIRECT_BUFFER = 140
    BGFX_FUNCTION_ID_ENCODER_SET_IMAGE = 141
    BGFX_FUNCTION_ID_ENCODER_DISPATCH = 142
    BGFX_FUNCTION_ID_ENCODER_DISPATCH_INDIRECT = 143
    BGFX_FUNCTION_ID_ENCODER_DISCARD = 144
    BGFX_FUNCTION_ID_ENCODER_BLIT = 145
    BGFX_FUNCTION_ID_REQUEST_SCREEN_SHOT = 146
    BGFX_FUNCTION_ID_RENDER_FRAME = 147
    BGFX_FUNCTION_ID_SET_PLATFORM_DATA = 148
    BGFX_FUNCTION_ID_GET_INTERNAL_DATA = 149
    BGFX_FUNCTION_ID_OVERRIDE_INTERNAL_TEXTURE_PTR = 150
    BGFX_FUNCTION_ID_OVERRIDE_INTERNAL_TEXTURE = 151
    BGFX_FUNCTION_ID_SET_MARKER = 152
    BGFX_FUNCTION_ID_SET_STATE = 153
    BGFX_FUNCTION_ID_SET_CONDITION = 154
    BGFX_FUNCTION_ID_SET_STENCIL = 155
    BGFX_FUNCTION_ID_SET_SCISSOR = 156
    BGFX_FUNCTION_ID_SET_SCISSOR_CACHED = 157
    BGFX_FUNCTION_ID_SET_TRANSFORM = 158
    BGFX_FUNCTION_ID_SET_TRANSFORM_CACHED = 159
    BGFX_FUNCTION_ID_ALLOC_TRANSFORM = 160
    BGFX_FUNCTION_ID_SET_UNIFORM = 161
    BGFX_FUNCTION_ID_SET_INDEX_BUFFER = 162
    BGFX_FUNCTION_ID_SET_DYNAMIC_INDEX_BUFFER = 163
    BGFX_FUNCTION_ID_SET_TRANSIENT_INDEX_BUFFER = 164
    BGFX_FUNCTION_ID_SET_VERTEX_BUFFER = 165
    BGFX_FUNCTION_ID_SET_VERTEX_BUFFER_WITH_LAYOUT = 166
    BGFX_FUNCTION_ID_SET_DYNAMIC_VERTEX_BUFFER = 167
    BGFX_FUNCTION_ID_SET_DYNAMIC_VERTEX_BUFFER_WITH_LAYOUT = 168
    BGFX_FUNCTION_ID_SET_TRANSIENT_VERTEX_BUFFER = 169
    BGFX_FUNCTION_ID_SET_TRANSIENT_VERTEX_BUFFER_WITH_LAYOUT = 170
    BGFX_FUNCTION_ID_SET_VERTEX_COUNT = 171
    BGFX_FUNCTION_ID_SET_INSTANCE_DATA_BUFFER = 172
    BGFX_FUNCTION_ID_SET_INSTANCE_DATA_FROM_VERTEX_BUFFER = 173
    BGFX_FUNCTION_ID_SET_INSTANCE_DATA_FROM_DYNAMIC_VERTEX_BUFFER = 174
    BGFX_FUNCTION_ID_SET_INSTANCE_COUNT = 175
    BGFX_FUNCTION_ID_SET_TEXTURE = 176
    BGFX_FUNCTION_ID_TOUCH = 177
    BGFX_FUNCTION_ID_SUBMIT = 178
    BGFX_FUNCTION_ID_SUBMIT_OCCLUSION_QUERY = 179
    BGFX_FUNCTION_ID_SUBMIT_INDIRECT = 180
    BGFX_FUNCTION_ID_SET_COMPUTE_INDEX_BUFFER = 181
    BGFX_FUNCTION_ID_SET_COMPUTE_VERTEX_BUFFER = 182
    BGFX_FUNCTION_ID_SET_COMPUTE_DYNAMIC_INDEX_BUFFER = 183
    BGFX_FUNCTION_ID_SET_COMPUTE_DYNAMIC_VERTEX_BUFFER = 184
    BGFX_FUNCTION_ID_SET_COMPUTE_INDIRECT_BUFFER = 185
    BGFX_FUNCTION_ID_SET_IMAGE = 186
    BGFX_FUNCTION_ID_DISPATCH = 187
    BGFX_FUNCTION_ID_DISPATCH_INDIRECT = 188
    BGFX_FUNCTION_ID_DISCARD = 189
    BGFX_FUNCTION_ID_BLIT = 190
    BGFX_FUNCTION_ID_COUNT = 191
end


const bgfx_function_id_t = bgfx_function_id
const PFN_BGFX_GET_INTERFACE = Ptr{Cvoid}

function bgfx_attachment_init(_this, _handle::bgfx_texture_handle_t, _access::bgfx_access_t, _layer::UInt16, _mip::UInt16, _resolve::UInt8)
    ccall((:bgfx_attachment_init, bgfx), Cvoid, (Ptr{bgfx_attachment_t}, bgfx_texture_handle_t, bgfx_access_t, UInt16, UInt16, UInt8), _this, _handle, _access, _layer, _mip, _resolve)
end

function bgfx_vertex_layout_begin(_this, _rendererType::bgfx_renderer_type_t)
    ccall((:bgfx_vertex_layout_begin, bgfx), Ptr{bgfx_vertex_layout_t}, (Ptr{bgfx_vertex_layout_t}, bgfx_renderer_type_t), _this, _rendererType)
end

function bgfx_vertex_layout_add(_this, _attrib::bgfx_attrib_t, _num::UInt8, _type::bgfx_attrib_type_t, _normalized::Bool, _asInt::Bool)
    ccall((:bgfx_vertex_layout_add, bgfx), Ptr{bgfx_vertex_layout_t}, (Ptr{bgfx_vertex_layout_t}, bgfx_attrib_t, UInt8, bgfx_attrib_type_t, Bool, Bool), _this, _attrib, _num, _type, _normalized, _asInt)
end

function bgfx_vertex_layout_decode(_this, _attrib::bgfx_attrib_t, _num, _type, _normalized, _asInt)
    ccall((:bgfx_vertex_layout_decode, bgfx), Cvoid, (Ptr{bgfx_vertex_layout_t}, bgfx_attrib_t, Ptr{UInt8}, Ptr{bgfx_attrib_type_t}, Ptr{Bool}, Ptr{Bool}), _this, _attrib, _num, _type, _normalized, _asInt)
end

function bgfx_vertex_layout_has(_this, _attrib::bgfx_attrib_t)
    ccall((:bgfx_vertex_layout_has, bgfx), Bool, (Ptr{bgfx_vertex_layout_t}, bgfx_attrib_t), _this, _attrib)
end

function bgfx_vertex_layout_skip(_this, _num::UInt8)
    ccall((:bgfx_vertex_layout_skip, bgfx), Ptr{bgfx_vertex_layout_t}, (Ptr{bgfx_vertex_layout_t}, UInt8), _this, _num)
end

function bgfx_vertex_layout_end(_this)
    ccall((:bgfx_vertex_layout_end, bgfx), Cvoid, (Ptr{bgfx_vertex_layout_t},), _this)
end

function bgfx_vertex_pack(_input, _inputNormalized::Bool, _attr::bgfx_attrib_t, _layout, _data, _index::UInt32)
    ccall((:bgfx_vertex_pack, bgfx), Cvoid, (Ptr{Cfloat}, Bool, bgfx_attrib_t, Ptr{bgfx_vertex_layout_t}, Ptr{Cvoid}, UInt32), _input, _inputNormalized, _attr, _layout, _data, _index)
end

function bgfx_vertex_unpack(_output, _attr::bgfx_attrib_t, _layout, _data, _index::UInt32)
    ccall((:bgfx_vertex_unpack, bgfx), Cvoid, (Ptr{Cfloat}, bgfx_attrib_t, Ptr{bgfx_vertex_layout_t}, Ptr{Cvoid}, UInt32), _output, _attr, _layout, _data, _index)
end

function bgfx_vertex_convert(_dstLayout, _dstData, _srcLayout, _srcData, _num::UInt32)
    ccall((:bgfx_vertex_convert, bgfx), Cvoid, (Ptr{bgfx_vertex_layout_t}, Ptr{Cvoid}, Ptr{bgfx_vertex_layout_t}, Ptr{Cvoid}, UInt32), _dstLayout, _dstData, _srcLayout, _srcData, _num)
end

function bgfx_weld_vertices(_output, _layout, _data, _num::UInt32, _index32::Bool, _epsilon::Cfloat)
    ccall((:bgfx_weld_vertices, bgfx), UInt32, (Ptr{Cvoid}, Ptr{bgfx_vertex_layout_t}, Ptr{Cvoid}, UInt32, Bool, Cfloat), _output, _layout, _data, _num, _index32, _epsilon)
end

function bgfx_topology_convert(_conversion::bgfx_topology_convert_t, _dst, _dstSize::UInt32, _indices, _numIndices::UInt32, _index32::Bool)
    ccall((:bgfx_topology_convert, bgfx), UInt32, (bgfx_topology_convert_t, Ptr{Cvoid}, UInt32, Ptr{Cvoid}, UInt32, Bool), _conversion, _dst, _dstSize, _indices, _numIndices, _index32)
end

function bgfx_topology_sort_tri_list(_sort::bgfx_topology_sort_t, _dst, _dstSize::UInt32, _dir, _pos, _vertices, _stride::UInt32, _indices, _numIndices::UInt32, _index32::Bool)
    ccall((:bgfx_topology_sort_tri_list, bgfx), Cvoid, (bgfx_topology_sort_t, Ptr{Cvoid}, UInt32, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cvoid}, UInt32, Ptr{Cvoid}, UInt32, Bool), _sort, _dst, _dstSize, _dir, _pos, _vertices, _stride, _indices, _numIndices, _index32)
end

function bgfx_get_supported_renderers(_max::UInt8, _enum)
    ccall((:bgfx_get_supported_renderers, bgfx), UInt8, (UInt8, Ptr{bgfx_renderer_type_t}), _max, _enum)
end

function bgfx_get_renderer_name(_type::bgfx_renderer_type_t)
    ccall((:bgfx_get_renderer_name, bgfx), Cstring, (bgfx_renderer_type_t,), _type)
end

function bgfx_init_ctor(_init)
    ccall((:bgfx_init_ctor, bgfx), Cvoid, (Ptr{bgfx_init_t},), _init)
end

function bgfx_init(_init)
    ccall((:bgfx_init, bgfx), Bool, (Ptr{bgfx_init_t},), _init)
end

function bgfx_shutdown()
    ccall((:bgfx_shutdown, bgfx), Cvoid, ())
end

function bgfx_reset(_width::UInt32, _height::UInt32, _flags::UInt32, _format::bgfx_texture_format_t)
    ccall((:bgfx_reset, bgfx), Cvoid, (UInt32, UInt32, UInt32, bgfx_texture_format_t), _width, _height, _flags, _format)
end

function bgfx_frame(_capture::Bool)
    ccall((:bgfx_frame, bgfx), UInt32, (Bool,), _capture)
end

function bgfx_get_renderer_type()
    ccall((:bgfx_get_renderer_type, bgfx), bgfx_renderer_type_t, ())
end

function bgfx_get_caps()
    ccall((:bgfx_get_caps, bgfx), Ptr{bgfx_caps_t}, ())
end

function bgfx_get_stats()
    ccall((:bgfx_get_stats, bgfx), Ptr{bgfx_stats_t}, ())
end

function bgfx_alloc(_size::UInt32)
    ccall((:bgfx_alloc, bgfx), Ptr{bgfx_memory_t}, (UInt32,), _size)
end

function bgfx_copy(_data, _size::UInt32)
    ccall((:bgfx_copy, bgfx), Ptr{bgfx_memory_t}, (Ptr{Cvoid}, UInt32), _data, _size)
end

function bgfx_make_ref(_data, _size::UInt32)
    ccall((:bgfx_make_ref, bgfx), Ptr{bgfx_memory_t}, (Ptr{Cvoid}, UInt32), _data, _size)
end

function bgfx_make_ref_release(_data, _size::UInt32, _releaseFn::bgfx_release_fn_t, _userData)
    ccall((:bgfx_make_ref_release, bgfx), Ptr{bgfx_memory_t}, (Ptr{Cvoid}, UInt32, bgfx_release_fn_t, Ptr{Cvoid}), _data, _size, _releaseFn, _userData)
end

function bgfx_set_debug(_debug::UInt32)
    ccall((:bgfx_set_debug, bgfx), Cvoid, (UInt32,), _debug)
end

function bgfx_dbg_text_clear(_attr::UInt8, _small::Bool)
    ccall((:bgfx_dbg_text_clear, bgfx), Cvoid, (UInt8, Bool), _attr, _small)
end

function bgfx_dbg_text_image(_x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16, _data, _pitch::UInt16)
    ccall((:bgfx_dbg_text_image, bgfx), Cvoid, (UInt16, UInt16, UInt16, UInt16, Ptr{Cvoid}, UInt16), _x, _y, _width, _height, _data, _pitch)
end

function bgfx_create_index_buffer(_mem, _flags::UInt16)
    ccall((:bgfx_create_index_buffer, bgfx), bgfx_index_buffer_handle_t, (Ptr{bgfx_memory_t}, UInt16), _mem, _flags)
end

function bgfx_set_index_buffer_name(_handle::bgfx_index_buffer_handle_t, _name, _len::Int32)
    ccall((:bgfx_set_index_buffer_name, bgfx), Cvoid, (bgfx_index_buffer_handle_t, Cstring, Int32), _handle, _name, _len)
end

function bgfx_destroy_index_buffer(_handle::bgfx_index_buffer_handle_t)
    ccall((:bgfx_destroy_index_buffer, bgfx), Cvoid, (bgfx_index_buffer_handle_t,), _handle)
end

function bgfx_create_vertex_layout(_layout)
    ccall((:bgfx_create_vertex_layout, bgfx), bgfx_vertex_layout_handle_t, (Ptr{bgfx_vertex_layout_t},), _layout)
end

function bgfx_destroy_vertex_layout(_layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_destroy_vertex_layout, bgfx), Cvoid, (bgfx_vertex_layout_handle_t,), _layoutHandle)
end

function bgfx_create_vertex_buffer(_mem, _layout, _flags::UInt16)
    ccall((:bgfx_create_vertex_buffer, bgfx), bgfx_vertex_buffer_handle_t, (Ptr{bgfx_memory_t}, Ptr{bgfx_vertex_layout_t}, UInt16), _mem, _layout, _flags)
end

function bgfx_set_vertex_buffer_name(_handle::bgfx_vertex_buffer_handle_t, _name, _len::Int32)
    ccall((:bgfx_set_vertex_buffer_name, bgfx), Cvoid, (bgfx_vertex_buffer_handle_t, Cstring, Int32), _handle, _name, _len)
end

function bgfx_destroy_vertex_buffer(_handle::bgfx_vertex_buffer_handle_t)
    ccall((:bgfx_destroy_vertex_buffer, bgfx), Cvoid, (bgfx_vertex_buffer_handle_t,), _handle)
end

function bgfx_create_dynamic_index_buffer(_num::UInt32, _flags::UInt16)
    ccall((:bgfx_create_dynamic_index_buffer, bgfx), bgfx_dynamic_index_buffer_handle_t, (UInt32, UInt16), _num, _flags)
end

function bgfx_create_dynamic_index_buffer_mem(_mem, _flags::UInt16)
    ccall((:bgfx_create_dynamic_index_buffer_mem, bgfx), bgfx_dynamic_index_buffer_handle_t, (Ptr{bgfx_memory_t}, UInt16), _mem, _flags)
end

function bgfx_update_dynamic_index_buffer(_handle::bgfx_dynamic_index_buffer_handle_t, _startIndex::UInt32, _mem)
    ccall((:bgfx_update_dynamic_index_buffer, bgfx), Cvoid, (bgfx_dynamic_index_buffer_handle_t, UInt32, Ptr{bgfx_memory_t}), _handle, _startIndex, _mem)
end

function bgfx_destroy_dynamic_index_buffer(_handle::bgfx_dynamic_index_buffer_handle_t)
    ccall((:bgfx_destroy_dynamic_index_buffer, bgfx), Cvoid, (bgfx_dynamic_index_buffer_handle_t,), _handle)
end

function bgfx_create_dynamic_vertex_buffer(_num::UInt32, _layout, _flags::UInt16)
    ccall((:bgfx_create_dynamic_vertex_buffer, bgfx), bgfx_dynamic_vertex_buffer_handle_t, (UInt32, Ptr{bgfx_vertex_layout_t}, UInt16), _num, _layout, _flags)
end

function bgfx_create_dynamic_vertex_buffer_mem(_mem, _layout, _flags::UInt16)
    ccall((:bgfx_create_dynamic_vertex_buffer_mem, bgfx), bgfx_dynamic_vertex_buffer_handle_t, (Ptr{bgfx_memory_t}, Ptr{bgfx_vertex_layout_t}, UInt16), _mem, _layout, _flags)
end

function bgfx_update_dynamic_vertex_buffer(_handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _mem)
    ccall((:bgfx_update_dynamic_vertex_buffer, bgfx), Cvoid, (bgfx_dynamic_vertex_buffer_handle_t, UInt32, Ptr{bgfx_memory_t}), _handle, _startVertex, _mem)
end

function bgfx_destroy_dynamic_vertex_buffer(_handle::bgfx_dynamic_vertex_buffer_handle_t)
    ccall((:bgfx_destroy_dynamic_vertex_buffer, bgfx), Cvoid, (bgfx_dynamic_vertex_buffer_handle_t,), _handle)
end

function bgfx_get_avail_transient_index_buffer(_num::UInt32)
    ccall((:bgfx_get_avail_transient_index_buffer, bgfx), UInt32, (UInt32,), _num)
end

function bgfx_get_avail_transient_vertex_buffer(_num::UInt32, _layout)
    ccall((:bgfx_get_avail_transient_vertex_buffer, bgfx), UInt32, (UInt32, Ptr{bgfx_vertex_layout_t}), _num, _layout)
end

function bgfx_get_avail_instance_data_buffer(_num::UInt32, _stride::UInt16)
    ccall((:bgfx_get_avail_instance_data_buffer, bgfx), UInt32, (UInt32, UInt16), _num, _stride)
end

function bgfx_alloc_transient_index_buffer(_tib, _num::UInt32)
    ccall((:bgfx_alloc_transient_index_buffer, bgfx), Cvoid, (Ptr{bgfx_transient_index_buffer_t}, UInt32), _tib, _num)
end

function bgfx_alloc_transient_vertex_buffer(_tvb, _num::UInt32, _layout)
    ccall((:bgfx_alloc_transient_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_transient_vertex_buffer_t}, UInt32, Ptr{bgfx_vertex_layout_t}), _tvb, _num, _layout)
end

function bgfx_alloc_transient_buffers(_tvb, _layout, _numVertices::UInt32, _tib, _numIndices::UInt32)
    ccall((:bgfx_alloc_transient_buffers, bgfx), Bool, (Ptr{bgfx_transient_vertex_buffer_t}, Ptr{bgfx_vertex_layout_t}, UInt32, Ptr{bgfx_transient_index_buffer_t}, UInt32), _tvb, _layout, _numVertices, _tib, _numIndices)
end

function bgfx_alloc_instance_data_buffer(_idb, _num::UInt32, _stride::UInt16)
    ccall((:bgfx_alloc_instance_data_buffer, bgfx), Cvoid, (Ptr{bgfx_instance_data_buffer_t}, UInt32, UInt16), _idb, _num, _stride)
end

function bgfx_create_indirect_buffer(_num::UInt32)
    ccall((:bgfx_create_indirect_buffer, bgfx), bgfx_indirect_buffer_handle_t, (UInt32,), _num)
end

function bgfx_destroy_indirect_buffer(_handle::bgfx_indirect_buffer_handle_t)
    ccall((:bgfx_destroy_indirect_buffer, bgfx), Cvoid, (bgfx_indirect_buffer_handle_t,), _handle)
end

function bgfx_create_shader(_mem)
    ccall((:bgfx_create_shader, bgfx), bgfx_shader_handle_t, (Ptr{bgfx_memory_t},), _mem)
end

function bgfx_get_shader_uniforms(_handle::bgfx_shader_handle_t, _uniforms, _max::UInt16)
    ccall((:bgfx_get_shader_uniforms, bgfx), UInt16, (bgfx_shader_handle_t, Ptr{bgfx_uniform_handle_t}, UInt16), _handle, _uniforms, _max)
end

function bgfx_set_shader_name(_handle::bgfx_shader_handle_t, _name, _len::Int32)
    ccall((:bgfx_set_shader_name, bgfx), Cvoid, (bgfx_shader_handle_t, Cstring, Int32), _handle, _name, _len)
end

function bgfx_destroy_shader(_handle::bgfx_shader_handle_t)
    ccall((:bgfx_destroy_shader, bgfx), Cvoid, (bgfx_shader_handle_t,), _handle)
end

function bgfx_create_program(_vsh::bgfx_shader_handle_t, _fsh::bgfx_shader_handle_t, _destroyShaders::Bool)
    ccall((:bgfx_create_program, bgfx), bgfx_program_handle_t, (bgfx_shader_handle_t, bgfx_shader_handle_t, Bool), _vsh, _fsh, _destroyShaders)
end

function bgfx_create_compute_program(_csh::bgfx_shader_handle_t, _destroyShaders::Bool)
    ccall((:bgfx_create_compute_program, bgfx), bgfx_program_handle_t, (bgfx_shader_handle_t, Bool), _csh, _destroyShaders)
end

function bgfx_destroy_program(_handle::bgfx_program_handle_t)
    ccall((:bgfx_destroy_program, bgfx), Cvoid, (bgfx_program_handle_t,), _handle)
end

function bgfx_is_texture_valid(_depth::UInt16, _cubeMap::Bool, _numLayers::UInt16, _format::bgfx_texture_format_t, _flags::UInt64)
    ccall((:bgfx_is_texture_valid, bgfx), Bool, (UInt16, Bool, UInt16, bgfx_texture_format_t, UInt64), _depth, _cubeMap, _numLayers, _format, _flags)
end

function bgfx_calc_texture_size(_info, _width::UInt16, _height::UInt16, _depth::UInt16, _cubeMap::Bool, _hasMips::Bool, _numLayers::UInt16, _format::bgfx_texture_format_t)
    ccall((:bgfx_calc_texture_size, bgfx), Cvoid, (Ptr{bgfx_texture_info_t}, UInt16, UInt16, UInt16, Bool, Bool, UInt16, bgfx_texture_format_t), _info, _width, _height, _depth, _cubeMap, _hasMips, _numLayers, _format)
end

function bgfx_create_texture(_mem, _flags::UInt64, _skip::UInt8, _info)
    ccall((:bgfx_create_texture, bgfx), bgfx_texture_handle_t, (Ptr{bgfx_memory_t}, UInt64, UInt8, Ptr{bgfx_texture_info_t}), _mem, _flags, _skip, _info)
end

function bgfx_create_texture_2d(_width::UInt16, _height::UInt16, _hasMips::Bool, _numLayers::UInt16, _format::bgfx_texture_format_t, _flags::UInt64, _mem)
    ccall((:bgfx_create_texture_2d, bgfx), bgfx_texture_handle_t, (UInt16, UInt16, Bool, UInt16, bgfx_texture_format_t, UInt64, Ptr{bgfx_memory_t}), _width, _height, _hasMips, _numLayers, _format, _flags, _mem)
end

function bgfx_create_texture_2d_scaled(_ratio::bgfx_backbuffer_ratio_t, _hasMips::Bool, _numLayers::UInt16, _format::bgfx_texture_format_t, _flags::UInt64)
    ccall((:bgfx_create_texture_2d_scaled, bgfx), bgfx_texture_handle_t, (bgfx_backbuffer_ratio_t, Bool, UInt16, bgfx_texture_format_t, UInt64), _ratio, _hasMips, _numLayers, _format, _flags)
end

function bgfx_create_texture_3d(_width::UInt16, _height::UInt16, _depth::UInt16, _hasMips::Bool, _format::bgfx_texture_format_t, _flags::UInt64, _mem)
    ccall((:bgfx_create_texture_3d, bgfx), bgfx_texture_handle_t, (UInt16, UInt16, UInt16, Bool, bgfx_texture_format_t, UInt64, Ptr{bgfx_memory_t}), _width, _height, _depth, _hasMips, _format, _flags, _mem)
end

function bgfx_create_texture_cube(_size::UInt16, _hasMips::Bool, _numLayers::UInt16, _format::bgfx_texture_format_t, _flags::UInt64, _mem)
    ccall((:bgfx_create_texture_cube, bgfx), bgfx_texture_handle_t, (UInt16, Bool, UInt16, bgfx_texture_format_t, UInt64, Ptr{bgfx_memory_t}), _size, _hasMips, _numLayers, _format, _flags, _mem)
end

function bgfx_update_texture_2d(_handle::bgfx_texture_handle_t, _layer::UInt16, _mip::UInt8, _x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16, _mem, _pitch::UInt16)
    ccall((:bgfx_update_texture_2d, bgfx), Cvoid, (bgfx_texture_handle_t, UInt16, UInt8, UInt16, UInt16, UInt16, UInt16, Ptr{bgfx_memory_t}, UInt16), _handle, _layer, _mip, _x, _y, _width, _height, _mem, _pitch)
end

function bgfx_update_texture_3d(_handle::bgfx_texture_handle_t, _mip::UInt8, _x::UInt16, _y::UInt16, _z::UInt16, _width::UInt16, _height::UInt16, _depth::UInt16, _mem)
    ccall((:bgfx_update_texture_3d, bgfx), Cvoid, (bgfx_texture_handle_t, UInt8, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, Ptr{bgfx_memory_t}), _handle, _mip, _x, _y, _z, _width, _height, _depth, _mem)
end

function bgfx_update_texture_cube(_handle::bgfx_texture_handle_t, _layer::UInt16, _side::UInt8, _mip::UInt8, _x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16, _mem, _pitch::UInt16)
    ccall((:bgfx_update_texture_cube, bgfx), Cvoid, (bgfx_texture_handle_t, UInt16, UInt8, UInt8, UInt16, UInt16, UInt16, UInt16, Ptr{bgfx_memory_t}, UInt16), _handle, _layer, _side, _mip, _x, _y, _width, _height, _mem, _pitch)
end

function bgfx_read_texture(_handle::bgfx_texture_handle_t, _data, _mip::UInt8)
    ccall((:bgfx_read_texture, bgfx), UInt32, (bgfx_texture_handle_t, Ptr{Cvoid}, UInt8), _handle, _data, _mip)
end

function bgfx_set_texture_name(_handle::bgfx_texture_handle_t, _name, _len::Int32)
    ccall((:bgfx_set_texture_name, bgfx), Cvoid, (bgfx_texture_handle_t, Cstring, Int32), _handle, _name, _len)
end

function bgfx_get_direct_access_ptr(_handle::bgfx_texture_handle_t)
    ccall((:bgfx_get_direct_access_ptr, bgfx), Ptr{Cvoid}, (bgfx_texture_handle_t,), _handle)
end

function bgfx_destroy_texture(_handle::bgfx_texture_handle_t)
    ccall((:bgfx_destroy_texture, bgfx), Cvoid, (bgfx_texture_handle_t,), _handle)
end

function bgfx_create_frame_buffer(_width::UInt16, _height::UInt16, _format::bgfx_texture_format_t, _textureFlags::UInt64)
    ccall((:bgfx_create_frame_buffer, bgfx), bgfx_frame_buffer_handle_t, (UInt16, UInt16, bgfx_texture_format_t, UInt64), _width, _height, _format, _textureFlags)
end

function bgfx_create_frame_buffer_scaled(_ratio::bgfx_backbuffer_ratio_t, _format::bgfx_texture_format_t, _textureFlags::UInt64)
    ccall((:bgfx_create_frame_buffer_scaled, bgfx), bgfx_frame_buffer_handle_t, (bgfx_backbuffer_ratio_t, bgfx_texture_format_t, UInt64), _ratio, _format, _textureFlags)
end

function bgfx_create_frame_buffer_from_handles(_num::UInt8, _handles, _destroyTexture::Bool)
    ccall((:bgfx_create_frame_buffer_from_handles, bgfx), bgfx_frame_buffer_handle_t, (UInt8, Ptr{bgfx_texture_handle_t}, Bool), _num, _handles, _destroyTexture)
end

function bgfx_create_frame_buffer_from_attachment(_num::UInt8, _attachment, _destroyTexture::Bool)
    ccall((:bgfx_create_frame_buffer_from_attachment, bgfx), bgfx_frame_buffer_handle_t, (UInt8, Ptr{bgfx_attachment_t}, Bool), _num, _attachment, _destroyTexture)
end

function bgfx_create_frame_buffer_from_nwh(_nwh, _width::UInt16, _height::UInt16, _format::bgfx_texture_format_t, _depthFormat::bgfx_texture_format_t)
    ccall((:bgfx_create_frame_buffer_from_nwh, bgfx), bgfx_frame_buffer_handle_t, (Ptr{Cvoid}, UInt16, UInt16, bgfx_texture_format_t, bgfx_texture_format_t), _nwh, _width, _height, _format, _depthFormat)
end

function bgfx_set_frame_buffer_name(_handle::bgfx_frame_buffer_handle_t, _name, _len::Int32)
    ccall((:bgfx_set_frame_buffer_name, bgfx), Cvoid, (bgfx_frame_buffer_handle_t, Cstring, Int32), _handle, _name, _len)
end

function bgfx_get_texture(_handle::bgfx_frame_buffer_handle_t, _attachment::UInt8)
    ccall((:bgfx_get_texture, bgfx), bgfx_texture_handle_t, (bgfx_frame_buffer_handle_t, UInt8), _handle, _attachment)
end

function bgfx_destroy_frame_buffer(_handle::bgfx_frame_buffer_handle_t)
    ccall((:bgfx_destroy_frame_buffer, bgfx), Cvoid, (bgfx_frame_buffer_handle_t,), _handle)
end

function bgfx_create_uniform(_name, _type::bgfx_uniform_type_t, _num::UInt16)
    ccall((:bgfx_create_uniform, bgfx), bgfx_uniform_handle_t, (Cstring, bgfx_uniform_type_t, UInt16), _name, _type, _num)
end

function bgfx_get_uniform_info(_handle::bgfx_uniform_handle_t, _info)
    ccall((:bgfx_get_uniform_info, bgfx), Cvoid, (bgfx_uniform_handle_t, Ptr{bgfx_uniform_info_t}), _handle, _info)
end

function bgfx_destroy_uniform(_handle::bgfx_uniform_handle_t)
    ccall((:bgfx_destroy_uniform, bgfx), Cvoid, (bgfx_uniform_handle_t,), _handle)
end

function bgfx_create_occlusion_query()
    ccall((:bgfx_create_occlusion_query, bgfx), bgfx_occlusion_query_handle_t, ())
end

function bgfx_get_result(_handle::bgfx_occlusion_query_handle_t, _result)
    ccall((:bgfx_get_result, bgfx), bgfx_occlusion_query_result_t, (bgfx_occlusion_query_handle_t, Ptr{Int32}), _handle, _result)
end

function bgfx_destroy_occlusion_query(_handle::bgfx_occlusion_query_handle_t)
    ccall((:bgfx_destroy_occlusion_query, bgfx), Cvoid, (bgfx_occlusion_query_handle_t,), _handle)
end

function bgfx_set_palette_color(_index::UInt8, _rgba)
    ccall((:bgfx_set_palette_color, bgfx), Cvoid, (UInt8, Ptr{Cfloat}), _index, _rgba)
end

function bgfx_set_palette_color_rgba8(_index::UInt8, _rgba::UInt32)
    ccall((:bgfx_set_palette_color_rgba8, bgfx), Cvoid, (UInt8, UInt32), _index, _rgba)
end

function bgfx_set_view_name(_id::bgfx_view_id_t, _name)
    ccall((:bgfx_set_view_name, bgfx), Cvoid, (bgfx_view_id_t, Cstring), _id, _name)
end

function bgfx_set_view_rect(_id::bgfx_view_id_t, _x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16)
    ccall((:bgfx_set_view_rect, bgfx), Cvoid, (bgfx_view_id_t, UInt16, UInt16, UInt16, UInt16), _id, _x, _y, _width, _height)
end

function bgfx_set_view_rect_ratio(_id::bgfx_view_id_t, _x::UInt16, _y::UInt16, _ratio::bgfx_backbuffer_ratio_t)
    ccall((:bgfx_set_view_rect_ratio, bgfx), Cvoid, (bgfx_view_id_t, UInt16, UInt16, bgfx_backbuffer_ratio_t), _id, _x, _y, _ratio)
end

function bgfx_set_view_scissor(_id::bgfx_view_id_t, _x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16)
    ccall((:bgfx_set_view_scissor, bgfx), Cvoid, (bgfx_view_id_t, UInt16, UInt16, UInt16, UInt16), _id, _x, _y, _width, _height)
end

function bgfx_set_view_clear(_id::bgfx_view_id_t, _flags::UInt16, _rgba::UInt32, _depth::Cfloat, _stencil::UInt8)
    ccall((:bgfx_set_view_clear, bgfx), Cvoid, (bgfx_view_id_t, UInt16, UInt32, Cfloat, UInt8), _id, _flags, _rgba, _depth, _stencil)
end

function bgfx_set_view_clear_mrt(_id::bgfx_view_id_t, _flags::UInt16, _depth::Cfloat, _stencil::UInt8, _c0::UInt8, _c1::UInt8, _c2::UInt8, _c3::UInt8, _c4::UInt8, _c5::UInt8, _c6::UInt8, _c7::UInt8)
    ccall((:bgfx_set_view_clear_mrt, bgfx), Cvoid, (bgfx_view_id_t, UInt16, Cfloat, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8), _id, _flags, _depth, _stencil, _c0, _c1, _c2, _c3, _c4, _c5, _c6, _c7)
end

function bgfx_set_view_mode(_id::bgfx_view_id_t, _mode::bgfx_view_mode_t)
    ccall((:bgfx_set_view_mode, bgfx), Cvoid, (bgfx_view_id_t, bgfx_view_mode_t), _id, _mode)
end

function bgfx_set_view_frame_buffer(_id::bgfx_view_id_t, _handle::bgfx_frame_buffer_handle_t)
    ccall((:bgfx_set_view_frame_buffer, bgfx), Cvoid, (bgfx_view_id_t, bgfx_frame_buffer_handle_t), _id, _handle)
end

function bgfx_set_view_transform(_id::bgfx_view_id_t, _view, _proj)
    ccall((:bgfx_set_view_transform, bgfx), Cvoid, (bgfx_view_id_t, Ptr{Cvoid}, Ptr{Cvoid}), _id, _view, _proj)
end

function bgfx_set_view_order(_id::bgfx_view_id_t, _num::UInt16, _order)
    ccall((:bgfx_set_view_order, bgfx), Cvoid, (bgfx_view_id_t, UInt16, Ptr{bgfx_view_id_t}), _id, _num, _order)
end

function bgfx_reset_view(_id::bgfx_view_id_t)
    ccall((:bgfx_reset_view, bgfx), Cvoid, (bgfx_view_id_t,), _id)
end

function bgfx_encoder_begin(_forThread::Bool)
    ccall((:bgfx_encoder_begin, bgfx), Ptr{bgfx_encoder_t}, (Bool,), _forThread)
end

function bgfx_encoder_end(_encoder)
    ccall((:bgfx_encoder_end, bgfx), Cvoid, (Ptr{bgfx_encoder_t},), _encoder)
end

function bgfx_encoder_set_marker(_this, _marker)
    ccall((:bgfx_encoder_set_marker, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, Cstring), _this, _marker)
end

function bgfx_encoder_set_state(_this, _state::UInt64, _rgba::UInt32)
    ccall((:bgfx_encoder_set_state, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt64, UInt32), _this, _state, _rgba)
end

function bgfx_encoder_set_condition(_this, _handle::bgfx_occlusion_query_handle_t, _visible::Bool)
    ccall((:bgfx_encoder_set_condition, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_occlusion_query_handle_t, Bool), _this, _handle, _visible)
end

function bgfx_encoder_set_stencil(_this, _fstencil::UInt32, _bstencil::UInt32)
    ccall((:bgfx_encoder_set_stencil, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt32, UInt32), _this, _fstencil, _bstencil)
end

function bgfx_encoder_set_scissor(_this, _x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16)
    ccall((:bgfx_encoder_set_scissor, bgfx), UInt16, (Ptr{bgfx_encoder_t}, UInt16, UInt16, UInt16, UInt16), _this, _x, _y, _width, _height)
end

function bgfx_encoder_set_scissor_cached(_this, _cache::UInt16)
    ccall((:bgfx_encoder_set_scissor_cached, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt16), _this, _cache)
end

function bgfx_encoder_set_transform(_this, _mtx, _num::UInt16)
    ccall((:bgfx_encoder_set_transform, bgfx), UInt32, (Ptr{bgfx_encoder_t}, Ptr{Cvoid}, UInt16), _this, _mtx, _num)
end

function bgfx_encoder_set_transform_cached(_this, _cache::UInt32, _num::UInt16)
    ccall((:bgfx_encoder_set_transform_cached, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt32, UInt16), _this, _cache, _num)
end

function bgfx_encoder_alloc_transform(_this, _transform, _num::UInt16)
    ccall((:bgfx_encoder_alloc_transform, bgfx), UInt32, (Ptr{bgfx_encoder_t}, Ptr{bgfx_transform_t}, UInt16), _this, _transform, _num)
end

function bgfx_encoder_set_uniform(_this, _handle::bgfx_uniform_handle_t, _value, _num::UInt16)
    ccall((:bgfx_encoder_set_uniform, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_uniform_handle_t, Ptr{Cvoid}, UInt16), _this, _handle, _value, _num)
end

function bgfx_encoder_set_index_buffer(_this, _handle::bgfx_index_buffer_handle_t, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_encoder_set_index_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_index_buffer_handle_t, UInt32, UInt32), _this, _handle, _firstIndex, _numIndices)
end

function bgfx_encoder_set_dynamic_index_buffer(_this, _handle::bgfx_dynamic_index_buffer_handle_t, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_encoder_set_dynamic_index_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_dynamic_index_buffer_handle_t, UInt32, UInt32), _this, _handle, _firstIndex, _numIndices)
end

function bgfx_encoder_set_transient_index_buffer(_this, _tib, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_encoder_set_transient_index_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, Ptr{bgfx_transient_index_buffer_t}, UInt32, UInt32), _this, _tib, _firstIndex, _numIndices)
end

function bgfx_encoder_set_vertex_buffer(_this, _stream::UInt8, _handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_encoder_set_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_vertex_buffer_handle_t, UInt32, UInt32), _this, _stream, _handle, _startVertex, _numVertices)
end

function bgfx_encoder_set_vertex_buffer_with_layout(_this, _stream::UInt8, _handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_encoder_set_vertex_buffer_with_layout, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_vertex_buffer_handle_t, UInt32, UInt32, bgfx_vertex_layout_handle_t), _this, _stream, _handle, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_encoder_set_dynamic_vertex_buffer(_this, _stream::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_encoder_set_dynamic_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32), _this, _stream, _handle, _startVertex, _numVertices)
end

function bgfx_encoder_set_dynamic_vertex_buffer_with_layout(_this, _stream::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_encoder_set_dynamic_vertex_buffer_with_layout, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32, bgfx_vertex_layout_handle_t), _this, _stream, _handle, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_encoder_set_transient_vertex_buffer(_this, _stream::UInt8, _tvb, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_encoder_set_transient_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, Ptr{bgfx_transient_vertex_buffer_t}, UInt32, UInt32), _this, _stream, _tvb, _startVertex, _numVertices)
end

function bgfx_encoder_set_transient_vertex_buffer_with_layout(_this, _stream::UInt8, _tvb, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_encoder_set_transient_vertex_buffer_with_layout, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, Ptr{bgfx_transient_vertex_buffer_t}, UInt32, UInt32, bgfx_vertex_layout_handle_t), _this, _stream, _tvb, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_encoder_set_vertex_count(_this, _numVertices::UInt32)
    ccall((:bgfx_encoder_set_vertex_count, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt32), _this, _numVertices)
end

function bgfx_encoder_set_instance_data_buffer(_this, _idb, _start::UInt32, _num::UInt32)
    ccall((:bgfx_encoder_set_instance_data_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, Ptr{bgfx_instance_data_buffer_t}, UInt32, UInt32), _this, _idb, _start, _num)
end

function bgfx_encoder_set_instance_data_from_vertex_buffer(_this, _handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _num::UInt32)
    ccall((:bgfx_encoder_set_instance_data_from_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_vertex_buffer_handle_t, UInt32, UInt32), _this, _handle, _startVertex, _num)
end

function bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer(_this, _handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _num::UInt32)
    ccall((:bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32), _this, _handle, _startVertex, _num)
end

function bgfx_encoder_set_instance_count(_this, _numInstances::UInt32)
    ccall((:bgfx_encoder_set_instance_count, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt32), _this, _numInstances)
end

function bgfx_encoder_set_texture(_this, _stage::UInt8, _sampler::bgfx_uniform_handle_t, _handle::bgfx_texture_handle_t, _flags::UInt32)
    ccall((:bgfx_encoder_set_texture, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_uniform_handle_t, bgfx_texture_handle_t, UInt32), _this, _stage, _sampler, _handle, _flags)
end

function bgfx_encoder_touch(_this, _id::bgfx_view_id_t)
    ccall((:bgfx_encoder_touch, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t), _this, _id)
end

function bgfx_encoder_submit(_this, _id::bgfx_view_id_t, _program::bgfx_program_handle_t, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_encoder_submit, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_program_handle_t, UInt32, UInt8), _this, _id, _program, _depth, _flags)
end

function bgfx_encoder_submit_occlusion_query(_this, _id::bgfx_view_id_t, _program::bgfx_program_handle_t, _occlusionQuery::bgfx_occlusion_query_handle_t, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_encoder_submit_occlusion_query, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_program_handle_t, bgfx_occlusion_query_handle_t, UInt32, UInt8), _this, _id, _program, _occlusionQuery, _depth, _flags)
end

function bgfx_encoder_submit_indirect(_this, _id::bgfx_view_id_t, _program::bgfx_program_handle_t, _indirectHandle::bgfx_indirect_buffer_handle_t, _start::UInt16, _num::UInt16, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_encoder_submit_indirect, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_program_handle_t, bgfx_indirect_buffer_handle_t, UInt16, UInt16, UInt32, UInt8), _this, _id, _program, _indirectHandle, _start, _num, _depth, _flags)
end

function bgfx_encoder_set_compute_index_buffer(_this, _stage::UInt8, _handle::bgfx_index_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_encoder_set_compute_index_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_index_buffer_handle_t, bgfx_access_t), _this, _stage, _handle, _access)
end

function bgfx_encoder_set_compute_vertex_buffer(_this, _stage::UInt8, _handle::bgfx_vertex_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_encoder_set_compute_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_vertex_buffer_handle_t, bgfx_access_t), _this, _stage, _handle, _access)
end

function bgfx_encoder_set_compute_dynamic_index_buffer(_this, _stage::UInt8, _handle::bgfx_dynamic_index_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_encoder_set_compute_dynamic_index_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_dynamic_index_buffer_handle_t, bgfx_access_t), _this, _stage, _handle, _access)
end

function bgfx_encoder_set_compute_dynamic_vertex_buffer(_this, _stage::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_encoder_set_compute_dynamic_vertex_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_dynamic_vertex_buffer_handle_t, bgfx_access_t), _this, _stage, _handle, _access)
end

function bgfx_encoder_set_compute_indirect_buffer(_this, _stage::UInt8, _handle::bgfx_indirect_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_encoder_set_compute_indirect_buffer, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_indirect_buffer_handle_t, bgfx_access_t), _this, _stage, _handle, _access)
end

function bgfx_encoder_set_image(_this, _stage::UInt8, _handle::bgfx_texture_handle_t, _mip::UInt8, _access::bgfx_access_t, _format::bgfx_texture_format_t)
    ccall((:bgfx_encoder_set_image, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8, bgfx_texture_handle_t, UInt8, bgfx_access_t, bgfx_texture_format_t), _this, _stage, _handle, _mip, _access, _format)
end

function bgfx_encoder_dispatch(_this, _id::bgfx_view_id_t, _program::bgfx_program_handle_t, _numX::UInt32, _numY::UInt32, _numZ::UInt32, _flags::UInt8)
    ccall((:bgfx_encoder_dispatch, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_program_handle_t, UInt32, UInt32, UInt32, UInt8), _this, _id, _program, _numX, _numY, _numZ, _flags)
end

function bgfx_encoder_dispatch_indirect(_this, _id::bgfx_view_id_t, _program::bgfx_program_handle_t, _indirectHandle::bgfx_indirect_buffer_handle_t, _start::UInt16, _num::UInt16, _flags::UInt8)
    ccall((:bgfx_encoder_dispatch_indirect, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_program_handle_t, bgfx_indirect_buffer_handle_t, UInt16, UInt16, UInt8), _this, _id, _program, _indirectHandle, _start, _num, _flags)
end

function bgfx_encoder_discard(_this, _flags::UInt8)
    ccall((:bgfx_encoder_discard, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, UInt8), _this, _flags)
end

function bgfx_encoder_blit(_this, _id::bgfx_view_id_t, _dst::bgfx_texture_handle_t, _dstMip::UInt8, _dstX::UInt16, _dstY::UInt16, _dstZ::UInt16, _src::bgfx_texture_handle_t, _srcMip::UInt8, _srcX::UInt16, _srcY::UInt16, _srcZ::UInt16, _width::UInt16, _height::UInt16, _depth::UInt16)
    ccall((:bgfx_encoder_blit, bgfx), Cvoid, (Ptr{bgfx_encoder_t}, bgfx_view_id_t, bgfx_texture_handle_t, UInt8, UInt16, UInt16, UInt16, bgfx_texture_handle_t, UInt8, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), _this, _id, _dst, _dstMip, _dstX, _dstY, _dstZ, _src, _srcMip, _srcX, _srcY, _srcZ, _width, _height, _depth)
end

function bgfx_request_screen_shot(_handle::bgfx_frame_buffer_handle_t, _filePath)
    ccall((:bgfx_request_screen_shot, bgfx), Cvoid, (bgfx_frame_buffer_handle_t, Cstring), _handle, _filePath)
end

function bgfx_render_frame(_msecs::Int32)
    ccall((:bgfx_render_frame, bgfx), bgfx_render_frame_t, (Int32,), _msecs)
end

function bgfx_set_platform_data(_data)
    ccall((:bgfx_set_platform_data, bgfx), Cvoid, (Ptr{bgfx_platform_data_t},), _data)
end

function bgfx_get_internal_data()
    ccall((:bgfx_get_internal_data, bgfx), Ptr{bgfx_internal_data_t}, ())
end

function bgfx_override_internal_texture_ptr(_handle::bgfx_texture_handle_t, _ptr::Csize_t)
    ccall((:bgfx_override_internal_texture_ptr, bgfx), Csize_t, (bgfx_texture_handle_t, Csize_t), _handle, _ptr)
end

function bgfx_override_internal_texture(_handle::bgfx_texture_handle_t, _width::UInt16, _height::UInt16, _numMips::UInt8, _format::bgfx_texture_format_t, _flags::UInt64)
    ccall((:bgfx_override_internal_texture, bgfx), Csize_t, (bgfx_texture_handle_t, UInt16, UInt16, UInt8, bgfx_texture_format_t, UInt64), _handle, _width, _height, _numMips, _format, _flags)
end

function bgfx_set_marker(_marker)
    ccall((:bgfx_set_marker, bgfx), Cvoid, (Cstring,), _marker)
end

function bgfx_set_state(_state::UInt64, _rgba::UInt32)
    ccall((:bgfx_set_state, bgfx), Cvoid, (UInt64, UInt32), _state, _rgba)
end

function bgfx_set_condition(_handle::bgfx_occlusion_query_handle_t, _visible::Bool)
    ccall((:bgfx_set_condition, bgfx), Cvoid, (bgfx_occlusion_query_handle_t, Bool), _handle, _visible)
end

function bgfx_set_stencil(_fstencil::UInt32, _bstencil::UInt32)
    ccall((:bgfx_set_stencil, bgfx), Cvoid, (UInt32, UInt32), _fstencil, _bstencil)
end

function bgfx_set_scissor(_x::UInt16, _y::UInt16, _width::UInt16, _height::UInt16)
    ccall((:bgfx_set_scissor, bgfx), UInt16, (UInt16, UInt16, UInt16, UInt16), _x, _y, _width, _height)
end

function bgfx_set_scissor_cached(_cache::UInt16)
    ccall((:bgfx_set_scissor_cached, bgfx), Cvoid, (UInt16,), _cache)
end

function bgfx_set_transform(_mtx, _num::UInt16)
    ccall((:bgfx_set_transform, bgfx), UInt32, (Ptr{Cvoid}, UInt16), _mtx, _num)
end

function bgfx_set_transform_cached(_cache::UInt32, _num::UInt16)
    ccall((:bgfx_set_transform_cached, bgfx), Cvoid, (UInt32, UInt16), _cache, _num)
end

function bgfx_alloc_transform(_transform, _num::UInt16)
    ccall((:bgfx_alloc_transform, bgfx), UInt32, (Ptr{bgfx_transform_t}, UInt16), _transform, _num)
end

function bgfx_set_uniform(_handle::bgfx_uniform_handle_t, _value, _num::UInt16)
    ccall((:bgfx_set_uniform, bgfx), Cvoid, (bgfx_uniform_handle_t, Ptr{Cvoid}, UInt16), _handle, _value, _num)
end

function bgfx_set_index_buffer(_handle::bgfx_index_buffer_handle_t, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_set_index_buffer, bgfx), Cvoid, (bgfx_index_buffer_handle_t, UInt32, UInt32), _handle, _firstIndex, _numIndices)
end

function bgfx_set_dynamic_index_buffer(_handle::bgfx_dynamic_index_buffer_handle_t, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_set_dynamic_index_buffer, bgfx), Cvoid, (bgfx_dynamic_index_buffer_handle_t, UInt32, UInt32), _handle, _firstIndex, _numIndices)
end

function bgfx_set_transient_index_buffer(_tib, _firstIndex::UInt32, _numIndices::UInt32)
    ccall((:bgfx_set_transient_index_buffer, bgfx), Cvoid, (Ptr{bgfx_transient_index_buffer_t}, UInt32, UInt32), _tib, _firstIndex, _numIndices)
end

function bgfx_set_vertex_buffer(_stream::UInt8, _handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_set_vertex_buffer, bgfx), Cvoid, (UInt8, bgfx_vertex_buffer_handle_t, UInt32, UInt32), _stream, _handle, _startVertex, _numVertices)
end

function bgfx_set_vertex_buffer_with_layout(_stream::UInt8, _handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_set_vertex_buffer_with_layout, bgfx), Cvoid, (UInt8, bgfx_vertex_buffer_handle_t, UInt32, UInt32, bgfx_vertex_layout_handle_t), _stream, _handle, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_set_dynamic_vertex_buffer(_stream::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_set_dynamic_vertex_buffer, bgfx), Cvoid, (UInt8, bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32), _stream, _handle, _startVertex, _numVertices)
end

function bgfx_set_dynamic_vertex_buffer_with_layout(_stream::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_set_dynamic_vertex_buffer_with_layout, bgfx), Cvoid, (UInt8, bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32, bgfx_vertex_layout_handle_t), _stream, _handle, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_set_transient_vertex_buffer(_stream::UInt8, _tvb, _startVertex::UInt32, _numVertices::UInt32)
    ccall((:bgfx_set_transient_vertex_buffer, bgfx), Cvoid, (UInt8, Ptr{bgfx_transient_vertex_buffer_t}, UInt32, UInt32), _stream, _tvb, _startVertex, _numVertices)
end

function bgfx_set_transient_vertex_buffer_with_layout(_stream::UInt8, _tvb, _startVertex::UInt32, _numVertices::UInt32, _layoutHandle::bgfx_vertex_layout_handle_t)
    ccall((:bgfx_set_transient_vertex_buffer_with_layout, bgfx), Cvoid, (UInt8, Ptr{bgfx_transient_vertex_buffer_t}, UInt32, UInt32, bgfx_vertex_layout_handle_t), _stream, _tvb, _startVertex, _numVertices, _layoutHandle)
end

function bgfx_set_vertex_count(_numVertices::UInt32)
    ccall((:bgfx_set_vertex_count, bgfx), Cvoid, (UInt32,), _numVertices)
end

function bgfx_set_instance_data_buffer(_idb, _start::UInt32, _num::UInt32)
    ccall((:bgfx_set_instance_data_buffer, bgfx), Cvoid, (Ptr{bgfx_instance_data_buffer_t}, UInt32, UInt32), _idb, _start, _num)
end

function bgfx_set_instance_data_from_vertex_buffer(_handle::bgfx_vertex_buffer_handle_t, _startVertex::UInt32, _num::UInt32)
    ccall((:bgfx_set_instance_data_from_vertex_buffer, bgfx), Cvoid, (bgfx_vertex_buffer_handle_t, UInt32, UInt32), _handle, _startVertex, _num)
end

function bgfx_set_instance_data_from_dynamic_vertex_buffer(_handle::bgfx_dynamic_vertex_buffer_handle_t, _startVertex::UInt32, _num::UInt32)
    ccall((:bgfx_set_instance_data_from_dynamic_vertex_buffer, bgfx), Cvoid, (bgfx_dynamic_vertex_buffer_handle_t, UInt32, UInt32), _handle, _startVertex, _num)
end

function bgfx_set_instance_count(_numInstances::UInt32)
    ccall((:bgfx_set_instance_count, bgfx), Cvoid, (UInt32,), _numInstances)
end

function bgfx_set_texture(_stage::UInt8, _sampler::bgfx_uniform_handle_t, _handle::bgfx_texture_handle_t, _flags::UInt32)
    ccall((:bgfx_set_texture, bgfx), Cvoid, (UInt8, bgfx_uniform_handle_t, bgfx_texture_handle_t, UInt32), _stage, _sampler, _handle, _flags)
end

function bgfx_touch(_id::bgfx_view_id_t)
    ccall((:bgfx_touch, bgfx), Cvoid, (bgfx_view_id_t,), _id)
end

function bgfx_submit(_id::bgfx_view_id_t, _program::bgfx_program_handle_t, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_submit, bgfx), Cvoid, (bgfx_view_id_t, bgfx_program_handle_t, UInt32, UInt8), _id, _program, _depth, _flags)
end

function bgfx_submit_occlusion_query(_id::bgfx_view_id_t, _program::bgfx_program_handle_t, _occlusionQuery::bgfx_occlusion_query_handle_t, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_submit_occlusion_query, bgfx), Cvoid, (bgfx_view_id_t, bgfx_program_handle_t, bgfx_occlusion_query_handle_t, UInt32, UInt8), _id, _program, _occlusionQuery, _depth, _flags)
end

function bgfx_submit_indirect(_id::bgfx_view_id_t, _program::bgfx_program_handle_t, _indirectHandle::bgfx_indirect_buffer_handle_t, _start::UInt16, _num::UInt16, _depth::UInt32, _flags::UInt8)
    ccall((:bgfx_submit_indirect, bgfx), Cvoid, (bgfx_view_id_t, bgfx_program_handle_t, bgfx_indirect_buffer_handle_t, UInt16, UInt16, UInt32, UInt8), _id, _program, _indirectHandle, _start, _num, _depth, _flags)
end

function bgfx_set_compute_index_buffer(_stage::UInt8, _handle::bgfx_index_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_set_compute_index_buffer, bgfx), Cvoid, (UInt8, bgfx_index_buffer_handle_t, bgfx_access_t), _stage, _handle, _access)
end

function bgfx_set_compute_vertex_buffer(_stage::UInt8, _handle::bgfx_vertex_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_set_compute_vertex_buffer, bgfx), Cvoid, (UInt8, bgfx_vertex_buffer_handle_t, bgfx_access_t), _stage, _handle, _access)
end

function bgfx_set_compute_dynamic_index_buffer(_stage::UInt8, _handle::bgfx_dynamic_index_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_set_compute_dynamic_index_buffer, bgfx), Cvoid, (UInt8, bgfx_dynamic_index_buffer_handle_t, bgfx_access_t), _stage, _handle, _access)
end

function bgfx_set_compute_dynamic_vertex_buffer(_stage::UInt8, _handle::bgfx_dynamic_vertex_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_set_compute_dynamic_vertex_buffer, bgfx), Cvoid, (UInt8, bgfx_dynamic_vertex_buffer_handle_t, bgfx_access_t), _stage, _handle, _access)
end

function bgfx_set_compute_indirect_buffer(_stage::UInt8, _handle::bgfx_indirect_buffer_handle_t, _access::bgfx_access_t)
    ccall((:bgfx_set_compute_indirect_buffer, bgfx), Cvoid, (UInt8, bgfx_indirect_buffer_handle_t, bgfx_access_t), _stage, _handle, _access)
end

function bgfx_set_image(_stage::UInt8, _handle::bgfx_texture_handle_t, _mip::UInt8, _access::bgfx_access_t, _format::bgfx_texture_format_t)
    ccall((:bgfx_set_image, bgfx), Cvoid, (UInt8, bgfx_texture_handle_t, UInt8, bgfx_access_t, bgfx_texture_format_t), _stage, _handle, _mip, _access, _format)
end

function bgfx_dispatch(_id::bgfx_view_id_t, _program::bgfx_program_handle_t, _numX::UInt32, _numY::UInt32, _numZ::UInt32, _flags::UInt8)
    ccall((:bgfx_dispatch, bgfx), Cvoid, (bgfx_view_id_t, bgfx_program_handle_t, UInt32, UInt32, UInt32, UInt8), _id, _program, _numX, _numY, _numZ, _flags)
end

function bgfx_dispatch_indirect(_id::bgfx_view_id_t, _program::bgfx_program_handle_t, _indirectHandle::bgfx_indirect_buffer_handle_t, _start::UInt16, _num::UInt16, _flags::UInt8)
    ccall((:bgfx_dispatch_indirect, bgfx), Cvoid, (bgfx_view_id_t, bgfx_program_handle_t, bgfx_indirect_buffer_handle_t, UInt16, UInt16, UInt8), _id, _program, _indirectHandle, _start, _num, _flags)
end

function bgfx_discard(_flags::UInt8)
    ccall((:bgfx_discard, bgfx), Cvoid, (UInt8,), _flags)
end

function bgfx_blit(_id::bgfx_view_id_t, _dst::bgfx_texture_handle_t, _dstMip::UInt8, _dstX::UInt16, _dstY::UInt16, _dstZ::UInt16, _src::bgfx_texture_handle_t, _srcMip::UInt8, _srcX::UInt16, _srcY::UInt16, _srcZ::UInt16, _width::UInt16, _height::UInt16, _depth::UInt16)
    ccall((:bgfx_blit, bgfx), Cvoid, (bgfx_view_id_t, bgfx_texture_handle_t, UInt8, UInt16, UInt16, UInt16, bgfx_texture_handle_t, UInt8, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), _id, _dst, _dstMip, _dstX, _dstY, _dstZ, _src, _srcMip, _srcX, _srcY, _srcZ, _width, _height, _depth)
end

function bgfx_get_interface(_version::UInt32)
    ccall((:bgfx_get_interface, bgfx), Ptr{bgfx_interface_vtbl_t}, (UInt32,), _version)
end
