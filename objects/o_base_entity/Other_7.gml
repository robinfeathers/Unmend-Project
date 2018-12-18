if sprite_index == air_arc_animation
{
	play_animation(air_fall_animation);
}

if sprite_index == turn_idle_animation or turn_run_animation
{
	disallow_turning = false;
}

if sprite_index == reset_animation
{
	play_animation(idle_animation_01);
}