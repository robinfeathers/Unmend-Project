//show_debug_message(vsp)
image_xscale = intended_direction;
//LEFTSLOPE
if on_l_slope == true
{
	if intended_direction == -1
	{
		play_animation(s_player_slide_down);
		slide_decay_time = slide_decay_timemax;
		
		if abs(slidesp) < max_slidesp
		{
			slidesp += slide_stop * 3;
		}
		else
		{
			slidesp = max_slidesp;
		}
	}
	if (intended_direction == 1)
	{
		play_animation(s_player_slide_up);
		
		if (slide_decay_time <= 0)
		{		
			slidesp -= slide_stop * 1.5;
		}
	}
}
//RIGHTSLOPE
if on_r_slope == true
{
	if intended_direction == 1
	{
		play_animation(s_player_slide_down);
		slide_decay_time = slide_decay_timemax;		
		
		if slidesp < max_slidesp
		{
			slidesp += slide_stop * 3;
		}
		else
		{
			slidesp = max_slidesp;
		}
	}
	if (intended_direction == -1)
	{
		play_animation(s_player_slide_up);
		
		if (slide_decay_time <= 0)
		{
			slidesp -= slide_stop * 1.5;
		}
	}
}
//NOTSLOPE
if (!on_l_slope) and (!on_r_slope)
{
	if slide_decay_time <= 0
	{
		if check_if_ground(3)
		{
			slidesp -= slide_stop;
		}
		else
		{
			slidesp -= slide_stop/1.5;		
		}
	}
	if check_if_ground(3)
	{
		play_animation(s_player_slide_normal);
	}
}

//spawn fx
var fx_dir = image_xscale;
if (sprite_index == s_player_slide_down
|| sprite_index == s_player_slide_up
|| sprite_index == s_player_slide_normal)
and abs(hsp) > 3
{
	if slide_dust_timer <= 0
	{
		slide_dust_timer = 2;
		var inst = instance_create_depth(x - (intended_direction * 4),y,"Particle_Objects",fx_animate_disappear_object)
		with inst
		{
			image_xscale = fx_dir;
			hsp = -1;
			vsp = -1;
			play_animation(s_fx_sliding_dust);
		}	
	}
	else slide_dust_timer -= get_delta_time();
}

hsp = slidesp * intended_direction

//SUBTRACT FROM DECAY TIMER
if check_if_ground(3) == true
{
	slide_decay_time -= get_delta_time();
}
else
{
	slide_decay_time -= (get_delta_time()/4);
}
on_r_slope = false;
on_l_slope = false;

var r_slope = instance_place(x,y+max_fallsp,o_t_solid_r_slope);
var l_slope = instance_place(x,y+max_fallsp,o_t_solid_l_slope);

//END EVENT
if (abs(slidesp) <= starting_slidesp - 4)
|| (my_direction != 0 and my_direction != slide_direction)
|| (place_meeting(x+hsp,y,o_t_solid) and r_slope == noone and l_slope == noone)
{ 
	if (my_direction != 0 and my_direction != slide_direction)
	{
		play_animation(s_player_stop);
		lockwalk_time = 40;
		lockout_time = 20;	
		hsp = (slidesp / 2) * intended_direction;
		mystate = player_state.acting;
		slide_stopping = true
	}
	else if my_direction == slide_direction
	{
		airborn = false;
		play_animation(s_player_run);
		mystate = player_state.neutral;
	}
	else
	{
		play_animation(s_player_stop)
		hsp = (slidesp / 2) * intended_direction;
	}
		sliding = false;	
		slidesp = 0;
		slide_decay_time = 0;
		slide_dust_timer = 0;
		//mystate = player_state.acting;		
}
on_r_slope = false;
on_l_slope = false;
