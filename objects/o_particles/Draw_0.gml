/*
var surf = surface_create(global.view_width, global.view_height)
surface_set_target(surf)
draw_clear_alpha(make_color_rgb(40, 30, 60), 0.7)
surface_reset_target()
draw_surface(surf, o_camera.view_x, o_camera.view_y)
surface_free(surf)
*/

if thunder == -1 {thunder = irandom_range(300, 800)}
else if thunder > 0 {thunder -= max(get_delta_time(), 0)}
else
{
	thunderalpha = 1
	thunder = -1
}

if thunderalpha > 0
{
	var surf = surface_create(global.view_width, global.view_height)
	surface_set_target(surf)
	draw_clear_alpha(c_white, 1)
	surface_reset_target()
	draw_set_alpha(thunderalpha)
	gpu_set_blendmode(bm_add)
	draw_surface(surf, o_camera.view_x, o_camera.view_y)
	surface_free(surf)
	gpu_set_blendmode(bm_normal)
	draw_set_alpha(1)
	thunderalpha -= 0.05 * get_delta_time()
}