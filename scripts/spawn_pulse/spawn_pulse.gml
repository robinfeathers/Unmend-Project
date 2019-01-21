if create_pulse
and sprite_index == reset_animation
and floor(argument[0]) == pulse_start_frame
{
	create_pulse = false;
	pulse_points -= pulse_points_requirement;
	pulse_points = max(pulse_points,0);
	instance_create_depth(x + pulse_o_x * facing_direction, y + pulse_o_y, 8, pulse_effect);
}