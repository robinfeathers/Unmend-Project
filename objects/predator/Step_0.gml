if instance_exists(o_vernal)
{
	x += sign(o_vernal.x - x) * 0.1
	while position_meeting(x, y, o_t_solid) || position_meeting(x, y, o_t_solid_l_slope) || position_meeting(x, y, o_t_solid_r_slope)
	{
		y -= 1
	}
	while !check_ground(x, y + 1)
	{
		y += 1
	}
	if point_in_circle(o_vernal.x, o_vernal.y, x, y, radius)
	{
		o_vernal.got_hit = true
		o_vernal.take_damage_type = "physical"
		o_vernal.launch_property = l_property.launch_up
		o_vernal.hp /= 4
		o_vernal.poise = 0
		o_game.fadetimer = 1
		camera_fade(false, 100, make_color_rgb(50, 10, 50))
		instance_destroy()
	}
}
part_emitter_region(sys, emit, x - radius, x + radius, y - radius - 20, y + radius - 20, ps_shape_ellipse, ps_distr_gaussian)
part_emitter_region(sys, emit2, x - radius, x + radius, y - radius - 20, y + radius - 20, ps_shape_ellipse, ps_distr_gaussian)