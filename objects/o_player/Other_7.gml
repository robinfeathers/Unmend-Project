/// @description perform animation transitions

//Ground Animations
if sprite_index == s_player_stop
{
	play_animation(s_player_idle);
}

if sprite_index == s_player_turn_idle
{
	if (abs(my_direction) != 0) and (check_if_ground(4))
	{
		play_animation(s_player_run);
	}
	
	if (abs(my_direction) == 0) and (check_if_ground(4))
	{
		play_animation(s_player_idle);		
	}
}

if sprite_index == s_player_turn_run
{
	if (hsp != 0) and (check_if_ground(4))
	{
		play_animation(s_player_run);
	}
	if (hsp == 0) and (check_if_ground(4))
	{
		play_animation(s_player_idle);
		
		if (image_xscale = -1) and (my_direction == 1)
		{
			image_xscale = 1;
		}
		if image_xscale = 1 and (my_direction == -1)
		{
			image_xscale = -1;
		}
	}
}

//Air Animations
if sprite_index == s_player_arc
{
	//Seems fine but may cause problems later
	if airborn == true
	{
		play_animation(s_player_fall);
	}
	
}

if sprite_index == s_player_ledge_grab
{
	play_animation(s_player_ledge_hold);
}
if sprite_index == s_player_ledge_getup
{
	play_animation(s_player_idle);
	x += intended_direction * 11
	holding_ledge = false;
	invincible = false;
}

//Landing Animations
if sprite_index == s_player_land_stop
{
	airborn = false;
	play_animation(s_player_idle);
}

if sprite_index == s_player_land_run
{
	if hsp == 0
	{
		airborn = false;
		play_animation(s_player_idle);
	}
	else
	{
	airborn = false;
	play_animation(s_player_run);
	}
}

if sprite_index == s_player_dive_land
{
	if hsp == 0
	{
		airborn = false;
		play_animation(s_player_idle);
	}
	else
	{
		airborn = false;
		play_animation(s_player_run);
	}
}

//Attack animations
if sprite_index = s_player_divecut_spin
{
	play_animation(s_player_divecut_fall);
	dive_cutting = true;
}
if sprite_index = s_player_divecut_land
{
	play_animation(s_player_idle);
}

if sprite_index == s_player_ground01
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_ground02
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_ground03
{
	play_animation(s_player_idle);
}

if sprite_index == s_player_air01
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_air02
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_air03
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_air03_alt
{
	play_animation(s_player_idle);
}

if sprite_index == s_player_launch
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_stingerattack
{
	play_animation(s_player_idle);
}
if sprite_index == s_player_slideattack
{
	play_animation(s_player_idle);
}

//Ground Animations
if sprite_index == s_player_backflip
{
	play_animation(s_player_idle);
}

if sprite_index == s_player_dashstop
{
	play_animation(s_player_idle);
}

//Dive Attack
if sprite_index == s_player_dive_start
{
	play_animation(s_player_dive_fall);
	vsp = max_fallsp;
	run_dive_script = true;
}

//update direction because the normal event can't be run while these animations are playing
if (intended_direction == 1) and (image_xscale == -1)
{
	image_xscale = 1;
}
if (intended_direction == -1) and (image_xscale == 1)
{
	image_xscale = -1;
}