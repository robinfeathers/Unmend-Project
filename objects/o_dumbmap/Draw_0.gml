draw_self()
/*
if !surface_exists(surf) {surf = surface_create(global.view_width, global.view_height)}
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
draw_sprite(sprite_index, image_index, 0 - o_camera.view_x, 0 - o_camera.view_y)
surface_reset_target()
var h = global.view_height / 1.5
draw_surface_stretched(surf, o_camera.view_x, o_camera.view_y + global.view_height - h, global.view_width, h)