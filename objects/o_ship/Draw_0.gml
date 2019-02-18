var z_trunc = floor(z)
//draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, sprite_height - z, x, y + z)
draw_sprite(sprite_index, image_index, x, y + z)

// Shadow drawing	
draw_set_color(c_black)
draw_set_alpha(0.5)
if dir == 0 || dir == 2 {var shadow_width = sprite_width}
else {var shadow_width = sprite_width / 2}
for (var ind = 0; ind < shadow_width; ind += 1)
{
	// Get subimage - 0 for edge, 1 for inner
	var sind = 1
	if ind == 0 || ind == shadow_width - 1 {sind = 0}
	
	var center_x = floor(bbox_right - (bbox_right - bbox_left) / 2)
	var xpos = center_x - floor(shadow_width / 2) + ind
	var ypos = bbox_bottom + 80
	
	draw_sprite(s_shadow, sind, xpos, ypos)
}
draw_set_alpha(1)