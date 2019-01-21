if sprite_index == air_arc_animation
{
	play_animation(air_fall_animation);
}

if sprite_index == turn_idle_animation or turn_run_animation
{
	disallow_turning = false;
}
//player backstep cheat
if sprite_index = s_player_backflip hsp = 0;


//Airstep stuff because it's easiest to put here
if sprite_index == airstep_step_animation_01 or sprite_index == airstep_step_animation_02
{
	image_index = -1;
	/*character_air_step = false;
	var force_high_jump = false;
	if key_left and !key_right
	{
		if airstep_wall == true and x > ledge_x
		{
			force_high_jump = true;
		}
		else
		{
			character_action_set(slide_jump_animation_01,0,jump_height*0.9, 10, 10, true, true, false);
			hsp = input_direction * 4;
			image_xscale = sign(hsp);
		}
	}
	
	if !key_left and key_right
	{
		if airstep_wall == true and x < ledge_x
		{
			force_high_jump = true;
			show_debug_message(x)
			show_debug_message(ledge_x)
		}
		else 
		{
			character_action_set(slide_jump_animation_01,0,jump_height*0.9, 10, 10, true, true, false);
			hsp = input_direction * 4;
			image_xscale = sign(hsp);
		}
	}
	
	if (!key_left and !key_right) or force_high_jump
	{
		character_action_set(slide_jump_animation_02,0,jump_height*0.85, 10, 10, true, true, false);
	}
	reset_animation = noone;*/
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

//special actions
if sprite_index == ground_pound_animation_01
{
	play_animation(ground_pound_animation_02)
	vsp = max(max_fallsp*2,vsp);
}

if sprite_index == invincible_animation
{
	invincible_animation = noone;
	invincibility_starting_frame = 0;
	invincibility_ending_frame = 0;
	invincible = false;
}

if sprite_index == ledge_grab_animation
{
	play_animation(ledge_hold_animation);
}
if sprite_index == ledge_climb_animation
{
	x += image_xscale * 11
	end_attack()
	play_animation(idle_animation_01);
}