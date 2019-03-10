if essencestrength == 1
{
	if essencetimer <= 0
	{
		if place_meeting(x, y, o_darkness) {part_type_color1(o_particles.pHairessence, make_color_rgb(0, 0, 34))}
		else {part_type_color1(o_particles.pHairessence, make_color_rgb(202, 213, 214))}
		part_particles_create(o_particles.pHairessence_Sys, irandom_range(bbox_left, bbox_right), bbox_top + (bbox_bottom - bbox_top) / 2, o_particles.pHairessence, 1)
		essencetimer = 4
	}
	else {essencetimer -= 1}
}
essencestrength += essenceinc
essencestrength = clamp(essencestrength, 0, 1)

var basea = image_alpha
event_inherited()

image_alpha = basea * essencestrength
pal_swap_set(s_PalVhair, 1, false)
event_inherited();
pal_swap_reset()

image_alpha = basea