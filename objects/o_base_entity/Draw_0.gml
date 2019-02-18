/*
var draw_dumb = 0;
if Player_Object draw_dumb = 1;

draw_sprite_ext(sprite_index, image_index, x , y + draw_dumb, image_xscale, image_yscale, 0, -1, 1);
*/

var xmod = 0
var ymod = 0
if shake > 0
{
	xmod = random_range(shake_amount, -shake_amount)
	ymod = random_range(shake_amount, -shake_amount)
}
	
if place_meeting(x, y, o_darkness) {shader_set(shd_donkeykong)}
else
{
	// Shadow drawing	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	for (var ind = 0; ind < shadow_width; ind += 1)
	{
		// Get subimage - 0 for edge, 1 for inner
		var sind = 1
		if ind == 0 || ind == shadow_width - 1 {sind = 0}
	
		var xpos = x - floor(shadow_width / 2) + ind + xmod
		var ypos = bbox_top
	
		// Place shadow onto ground
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
			//ypos -= 4
			draw_sprite(s_shadow, sind, xpos, ypos)
		}
	}
}
draw_set_alpha(1)

// Draw regular sprite
draw_sprite_ext(sprite_index, image_index, x + xmod, y + ymod, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

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

shader_reset()