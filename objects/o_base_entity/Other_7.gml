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

//ON WAKE UP
if sprite_index == wake_animation
{
	play_animation(idle_animation_01);
	invincible = false;
	sleeping = false;
	my_entity_state = entity_state.neutral
}