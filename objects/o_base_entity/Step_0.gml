/// @desc Takes place before child step event
//Damage Taking Events
if got_hit
{
	if !invincible and !sleeping
	{
		got_hit = false;
		hp -= dmg_taken;
		hp = max(hp, 0);
		if my_entity_state != entity_state.stunned
		{
			poise -= poise_dmg_taken;
			poise = max(poise,0);
			shake = 2;
			shake_amount = 1;
		}
		else
		{
			stun_time -= poise_dmg_taken/3;
			stun_time = max(stun_time,0);
			shake = 3;
			shake_amount = 2;
		}
	}
	if poise > 0 and poise < poise_max and my_entity_state != entity_state.stunned
	{
		poise_regain = poise_regain_max;
	}
	else if poise <= 0 and my_entity_state != entity_state.stunned
	{
		my_entity_state = entity_state.stunned;
		end_attack();
		play_animation(stun_animation);
		stun_time = max_stun_time;
		poise_regain = 0;
		//Robin
		//BAR GETS CREATED HERE
		//lmao nah fam look in draw event
		//Vaiables are "stun_time" and "max_stun_time"
		instance_create_depth(x, bbox_bottom - ((bbox_bottom-bbox_top)/2),7,o_particle_test)
		stop_time = 8;
	}
	if my_entity_state == entity_state.stunned
	{
		stun_delay = stun_delay_max;
		//CCtypes
		if launch_property == l_property.launch_up
		{
			hsp = 0;
			vsp = -5.5;
			instance_create_depth(x, bbox_bottom, 8, launch_gust);
			play_animation(launch_up_animation);
		}
		else if launch_property == l_property.launch_down show_debug_message("DOWN")
		else if launch_property == l_property.launch_side show_debug_message("SIDE")
		else if launch_property == l_property.bounce show_debug_message("BOUNCE")
	}
	launch_property = l_property.none;
}
//time down to regain poise
if poise_regain > 0 and my_entity_state != entity_state.stunned
{
	poise_regain -= get_delta_time();
	poise_regain = max(poise_regain, 0);
}
//regain poise after delay
else if poise_regain <= 0 and poise < poise_max and my_entity_state != entity_state.stunned
{
	poise += get_delta_time();
	min(poise,poise_max);
}

//The delay until the stun timer is allowed to tick again
if stun_delay > 0 and my_entity_state == entity_state.stunned
{
	stun_delay -= get_delta_time();
	stun_delay  = max(stun_delay , 0);
}
//time down to ending stunned state
if stun_time > 0 and stun_delay  <= 0 and my_entity_state == entity_state.stunned
{
	stun_time -= (max_stun_time/100) * stun_recovery_rate * get_delta_time();
}
//return to neutral
else if stun_time <= 0 and my_entity_state == entity_state.stunned
{
	stun_time = 0;
	my_entity_state = entity_state.neutral;
	poise = poise_max;
}



//The following can only occur if the object is a Player_Object
if Player_Object = true
{
	get_player_input()
 
	//Set face direction to that of input
	//MISSING: common_action_denial script needs to be rewritten and included as a condition
	if (input_direction == 1) || (input_direction == -1)
	
	{
		if my_entity_state != entity_state.acting
		{
			facing_direction = input_direction;
		}
	}

	//INPUTS
	
	current_generic_action = generic_actions.idle;
	
	//Horizontal input
	if my_entity_state == entity_state.neutral
	and action_max_time <= 0
	{
		walk_with_input();
	}
	if my_entity_state == entity_state.acting and attack_hsp != 0
	{
		hsp = attack_hsp * input_direction;
	}
	
	//Jump key
	if key_jump and check_if_ground(4) and my_entity_state == entity_state.neutral
	{
		jump_buffered = true;
	}
	
	if key_jump or my_action_buffer == action_input_buffer.jump or (jump_buffered and check_if_ground(0))
	{
		if check_if_ground(7) and (my_entity_state == entity_state.neutral or action_min_time <= 0)
		{
			vsp = jump_height;
			end_attack();
			my_entity_state = entity_state.neutral;
			jump_buffered = false;
		}
	}
	if vsp < jump_height / 3
	and !key_jump_held
	and my_entity_state == entity_state.neutral
	{
		vsp = jump_height / 3;
	}
	
}
