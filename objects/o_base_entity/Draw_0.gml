var xmod = 0
var ymod = 0
if shake > 0
{
	xmod = random_range(shake_amount, -shake_amount)
	ymod = random_range(shake_amount, -shake_amount)
}
	
var surfw = shadow_width
var surfh = 7
var surf = surface_create(surfw, surfh)

	
surface_set_target(surf)
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_ellipse(0, 0, surfw - 1, surfh - 1, false)
draw_set_alpha(1)
surface_reset_target()
	
for (var i = 0; i < surfw; i += 1)
{
	var surf2 = surface_create(1, surfh)
	surface_set_target(surf2)
	draw_surface(surf, 0 - i, 0)
	surface_reset_target()
		
	var xpos = x - floor(shadow_width / 2) + i + xmod
	var ypos = bbox_top
	var failed = false
	while !check_ground(xpos, ypos)
	{
		ypos += 1
		if ypos > y + ymod + 100
		{
			failed = true
			break
		}
	}
	if !failed
	{
		ypos -= 4
		draw_surface(surf2, xpos, ypos)
	}
	surface_free(surf2)
}
	
surface_free(surf)


draw_sprite_ext(sprite_index, image_index, x + xmod, y + ymod, image_xscale, image_yscale, 0, -1, 1);

if stun_time > 0
{
	var chunknum = sprite_get_number(s_Stun)
	for (var i = 0; i < chunknum; i += 1)
	{
		var chunksize = max_stun_time / chunknum
		var a = (stun_time - i * chunksize) / chunksize
		a = max(0.2, a)
		draw_set_alpha(a)
		draw_sprite(s_Stun, i, x + xmod, y - sprite_yoffset + sprite_get_height(sprite_index) / 2 + ymod)
	}
	draw_set_alpha(1)
}