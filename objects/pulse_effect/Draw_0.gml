var c1 = make_color_rgb(185, 208, 210) // blue
var c2 = make_color_rgb(231, 252, 226) // white

/*
var surf = surface_create(128, 128)
var midpoint = radius
surface_set_target(surf)
draw_ellipse_color(x - life1, y - life1, x + life1, y + life1, c1, c1, 0)
gpu_set_blendmode(bm_subtract)
draw_ellipse_color(x - life2, y - life2, x + life2, y + life2, c2, c2, 0)
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(surf, x, y)
surface_free(surf)
*/

decay += 0.01
radius += 1
radius2 += 1

image_alpha -= decay
if image_alpha <= 0 {instance_destroy()}
draw_set_alpha(image_alpha)
draw_ellipse_color(x - radius, y - radius, x + radius, y + radius, c1, c1, 0)
draw_ellipse_color(x - radius2, y - radius2, x + radius2, y + radius2, c2, c2, 0)

draw_set_alpha(1)