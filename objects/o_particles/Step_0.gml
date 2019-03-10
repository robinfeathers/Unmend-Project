part_emitter_region(pRain_Sys, pRain_Emit, o_camera.view_x - global.view_width * 3, o_camera.view_x + global.view_width * 4, o_camera.view_y, o_camera.view_y, ps_shape_line, ps_distr_linear)

part_emitter_region(pRainF_Sys, pRainF_Emit, o_camera.view_x - global.view_width * 3, o_camera.view_x + global.view_width * 4, o_camera.view_y, o_camera.view_y, ps_shape_line, ps_distr_linear)

if instance_exists(o_vernal)
{
	part_system_depth(pHairessence_Sys, o_vernal.depth + 1)
}