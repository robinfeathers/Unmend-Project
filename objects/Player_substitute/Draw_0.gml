draw_self()
/*
var surfw = 24
var surfh = 7
var surf = surface_create(surfw, surfh)
	
surface_set_target(surf)
draw_set_color(c_black)
draw_set_alpha(0.7)
draw_ellipse(1, 1, surfw - 1, surfh - 1, false)
draw_set_alpha(1)
surface_reset_target()	
draw_surface(surf, x-surfw/2, bbox_bottom)	

surface_free(surf)

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 1);