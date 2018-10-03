if sprite_index == wake_sprite
{
	play_animation(idle_sprite)
	sleeping = false;
	poise = poise_max;
	poise_regen_time = poise_regen_time_max;
	stunduration = max_stunduration;
	vsp = 0;
	my_state = enemy_state.neutral
}