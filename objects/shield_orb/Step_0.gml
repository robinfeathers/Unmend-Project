if state == 1
{
	path_end()
	var angle = point_direction(x, y, o_vernal.x, o_vernal.y - 20)
	motion_set(angle, 3)
	if place_meeting(x, y, o_vernal)
	{
		if !instance_exists(absorb_effect)
		{
			var eff = instance_create_depth(0, 0, 0, absorb_effect)
			eff.time_max = 30
			eff.col = make_color_rgb(245, 171, 205)
			var grow = instance_create_depth(o_vernal.x, o_vernal.bbox_bottom-((o_vernal.bbox_bottom-o_vernal.bbox_top)/2), 8, grow_effect)
			with (grow)
			{
				max_scale = 1;
				growth_rate = 0.2;
				max_alpha = 1;
				image_blend = make_color_rgb(245, 171, 205)
				sprite_index = s_glow;
			}
		}
		instance_destroy()
	}
}
if state == 2
{
	path_end()
	var angle = point_direction(x, y, o_vernal.x, o_vernal.y - 20)
	motion_set(angle, 3)
	if place_meeting(x, y, o_vernal)
	{
		with shield_orb {instance_destroy()}
		instance_destroy(o_magic_barrier2)
	}
}
if state == 3
{
	timer -= 3
	if timer <= 0 {instance_destroy()}
	image_alpha = timer / timer_max
}