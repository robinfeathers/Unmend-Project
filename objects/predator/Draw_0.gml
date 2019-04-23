var col = make_color_rgb(20, 0, 20)
if !surface_exists(surf) {surf = surface_create(global.view_width, global.view_height)}
surface_set_target(surf)
var vdist = abs(o_vernal.x - x)
if vdist == 0 {vdist = 1}
draw_set_alpha(min(0.2 + 100 / vdist, 0.8))
draw_rectangle_color(0, 0, global.view_width, global.view_height, col, col, col, col, 0)
draw_set_alpha(1)
gpu_set_blendmode(bm_subtract)
draw_ellipse(x - o_camera.view_x - radius, y - 20 - o_camera.view_y - radius, x - o_camera.view_x + radius, y - 20 - o_camera.view_y + radius, 0)
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(surf, o_camera.view_x, o_camera.view_y)