/// @desc Takes place before child step event
//Damage Taking Events

if invincible_animation = sprite_index
{
	if floor(image_index) >= invincibility_starting_frame
	and floor(image_index) <= invincibility_ending_frame
	{
		invincible = true;
	}
	if floor(image_index) > invincibility_ending_frame
	{
		invincible = false;
	}
}

if got_hit and !invincible and !sleeping
{
//standard damage_taking
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
	
	if poise > 0 and poise < poise_max and my_entity_state != entity_state.stunned
	{
		poise_regain = poise_regain_max;
	}
	else if poise <= 0 and my_entity_state != entity_state.stunned
	{
		invincible_animation = noone;
		my_entity_state = entity_state.stunned;
		end_attack();
		hsp = 0;
		play_animation(stun_animation);
		stun_time = max_stun_time;
		poise_regain = 0;
		
		character_ground_pound = false;
		character_slide = false;
		character_air_step = false;
		character_dash = false;
		character_ledge_hold = false;
		
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
			character_stunned_state = stunned_state.launch_up
		}
		else if launch_property == l_property.launch_down show_debug_message("DOWN")
		else if launch_property == l_property.launch_side show_debug_message("SIDE")
		else if launch_property == l_property.bounce or character_stunned_state != stunned_state.none
		{
			character_stunned_state = stunned_state.bounce;
			vsp = -4;
			play_animation(bounce_floor_animation);
		}
	}
	launch_property = l_property.none
	//launch_property = l_property.none;
}

if got_hit and (invincible or sleeping)
{
	launch_property = l_property.none;
	dmg_taken = 0;
	poise_dmg_taken = 0;
	got_hit = false;
}

//Launch Functions

//bounce on ground
if character_stunned_state == stunned_state.launch_up and vsp >= 0 and check_if_ground(1)
{
	character_stunned_state = stunned_state.bounce;
	vsp = -4;
	play_animation(bounce_floor_animation);
}

if character_stunned_state == stunned_state.bounce
{
	if vsp >= 0 and !check_if_ground(1)
	{
		play_animation(launch_down_animation);
	}
	else if vsp >= 0 and check_if_ground(1)
	{
		play_animation(sleep_animation);
		character_stunned_state = stunned_state.none;
		sleeping = true;
		sleep_time = 45;
		invincible = true;
		stun_time = 0;
		poise = poise_max;
	}
}

//sleep
if sleep_time > 0 and sleeping
{
	sleep_time -= get_delta_time();
}
if sleep_time <= 0 and sleeping and my_entity_state == entity_state.stunned
{
	sleep_time = 0;
	play_animation(wake_animation);
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
	stun_delay = max(stun_delay , 0);
}
//time down to ending stunned state
if stun_time > 0 and stun_delay  <= 0 and my_entity_state == entity_state.stunned
{
	stun_time -= (max_stun_time/100) * stun_recovery_rate * get_delta_time();
}
//return to neutral
else if stun_time <= 0 and my_entity_state == entity_state.stunned and !sleeping
{
	stun_time = 0;
	my_entity_state = entity_state.neutral;
	poise = poise_max;
	character_stunned_state = stunned_state.none
}

//Sliding and Ground Pounding

//Ground Pound
if character_ground_pound
{
	var collision_results = character_collision(Player_Object, false, true, false, false)
	if collision_results == "ground"
	{
		character_ground_pound = false;
		character_action_set(ground_pound_animation_03,0,0,10,15,true,true,false);
	}
	if collision_results ==  "rslope"
	or collision_results ==  "lslope"
	{
		character_ground_pound = false;
		character_slide = true;
		if collision_results == "lslope"
		{
			slide_right = false;
			slide_left = true;
			hsp = max_slide_sp * 0.25 * -1;
			vsp = 0;
			facing_direction = -1;
			image_xscale = -1;
		}
		if collision_results == "rslope" 
		{
			slide_right = true;
			slide_left = false;
			hsp = max_slide_sp * 0.25;
			vsp = 0;
			facing_direction = 1;
			image_xscale = 1;
		}
	}
}

//Slide
if character_slide
{	
	var slide_time = true;
	var collision_results = character_collision(Player_Object, false, true, false, false)	
	if slide_left
	{
		if collision_results == "lslope"
		{
			play_animation(slide_down_animation);
			hsp -= 0.5 * get_delta_time();
			hsp = max(hsp, max_slide_sp * -1);
			slide_timer = (abs(hsp)/max_slide_sp) * 20;
		}
		if collision_results == "rslope"
		{
			play_animation(slide_up_animation);
			slide_timer = 0;
			hsp = image_xscale * min(max_slide_sp * 0.9, abs(hsp));
		}
	}
	
	if slide_right
	{
		if collision_results == "lslope"
		{
			play_animation(slide_up_animation);
			slide_timer = 0;
			hsp = image_xscale * min(max_slide_sp * 0.9, abs(hsp));
		}
		if collision_results == "rslope"
		{
			play_animation(slide_down_animation);
			hsp += 0.5 * get_delta_time();
			hsp = min(hsp, max_slide_sp);
			slide_timer = (abs(hsp)/max_slide_sp) * 20;
		}
	}
	
	if slide_left or slide_right
	{
		if collision_results == "ground"
		{
			play_animation(slide_straight_animation)
		}
		if collision_results == "none"
		{
			//TO BE ADJUSTED FOR FUTURE JUMP
			play_animation(slide_jump_animation_01);
			slide_time = false;
			hsp = image_xscale * min(max_slide_sp * 0.95, abs(hsp));
		}
	}
	
	if slide_time
	{
		slide_timer -= get_delta_time();
		slide_timer = max(0,slide_timer);
	}
	
	if character_collision(Player_Object, false, false, true, false, false) == "wall"
	{
		character_slide = false;
		character_action_set(stop_animation_01,0,0,10,15,true,true,false)
		slide_timer = 0;
	}
	
	if abs(hsp) < max_walk_sp/2 or input_direction + image_xscale == 0
	{
		character_slide = false;
		character_action_set(stop_animation_01,0,0,10,15,true,true,false);
		slide_timer = 0;
		if slide_left
		{
			hsp = max(abs(hsp), max_walk_sp/2) * image_xscale;
		}
		if slide_right
		{
			hsp = max(abs(hsp), max_walk_sp/2) * image_xscale;
		}
	}
	
	if slide_timer = 0 and character_slide and collision_results != "none"
	{
		hsp -= sign(image_xscale) * 0.1 * get_delta_time();
		if slide_right
		{
			hsp = max(0,hsp)
		}
		else if slide_left
		{
			hsp = min(0,hsp)
		}
	}
}

//The following can only occur if the object is a Player_Object
if Player_Object = true
{
	get_player_input()
 
	//Set face direction to that of input
	//MISSING: common_action_denial script needs to be rewritten and included as a condition
	if (input_direction == 1) || (input_direction == -1)
	{
		if my_entity_state != entity_state.acting and my_entity_state != entity_state.stunned
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
		if check_if_ground(4) and (my_entity_state == entity_state.neutral or action_min_time <= 0)
		and my_entity_state != entity_state.stunned
		and check_special_action_states(1,1,1,1,1)
		{
			vsp = jump_height;
			end_attack();
			my_entity_state = entity_state.neutral;
			jump_buffered = false;
		}
		
		if check_if_ground(4) and character_slide
		{
			if (slide_right and collision_results == "lslope") or (slide_left and collision_results == "rslope")
			{
				if input_direction != sign(hsp)
				{
					character_slide = false;
					hsp = hsp * 0.8;
					vsp = max(jump_height * 1.4, jump_height - abs(hsp));
					instance_create_depth(x, bbox_bottom-4, 8, launch_gust);
					//CHANGE TO VARIABLE LATER
					play_animation(slide_jump_animation_02);
					reset_animation = slide_jump_animation_02;
				}
				else
				{
					vsp = jump_height * 1.1;
					hsp += image_xscale;
					hsp = min(abs(hsp),max_slide_sp) * image_xscale;
				}
			}
			else
			{
			vsp = jump_height;
			}
			jump_buffered = false;
			my_action_buffer = action_input_buffer.none;
		}
	}
	
	if key_jump and key_down and !check_if_ground(4) and (my_entity_state == entity_state.neutral or character_slide)
	{
		character_action_set(s_player_dive_start,0,-1,0,0,false,true,false);
		vsp = -3
		character_ground_pound = true;
		character_slide = false;
	}
	
	
	if vsp < jump_height / 3
	and !key_jump_held
	and my_entity_state == entity_state.neutral
	and sprite_index != slide_jump_animation_02
	{
		vsp = jump_height / 3;
	}
}