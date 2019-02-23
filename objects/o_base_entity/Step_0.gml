/// @desc Takes place before child step event
//Damage Taking Events

if invincible_animation == sprite_index
{
	if floor(image_index) >= invincibility_starting_frame
	and (floor(image_index) <= invincibility_ending_frame or invincibility_ending_frame == -1)
	{
		invincible = true;
	}
	if floor(image_index) > invincibility_ending_frame
	and invincibility_ending_frame != -1
	{
		invincible = false;
		invincible_animation = noone;
		invincibility_starting_frame = 0;
		invincibility_ending_frame = 0;
	}
}

if (block_animation == sprite_index or block_recoil_animation == sprite_index)
and take_damage_type = "physical"
{
	if floor(image_index) >= block_starting_frame
	and (floor(image_index) <= block_ending_frame or block_ending_frame == -1)
	{
		block_attack = true;
	}
	else if floor(image_index) > block_ending_frame
	and block_ending_frame != -1
	{
		block_attack = false;
		character_block = noone;
	}
}

if got_hit and block_attack
{
	if image_xscale != hit_direction
	{
		block_attack = false
	}
	else 
	{
		character_action_set(block_recoil_animation,0,0,30,35,true,true,true);
		image_index = 0;
		block_anim_set(0,10);
	}
}

if got_hit and !invincible and !sleeping and !block_attack and take_damage_type != "none"
{
//standard damage_taking
	got_hit = false;
	take_damage_type = "none"
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
			vsp = -5.8;
			instance_create_depth(x, bbox_bottom, 8, launch_gust);
			play_animation(launch_up_animation);
			character_stunned_state = stunned_state.launch_up
		}
		else if launch_property == l_property.launch_down show_debug_message("DOWN")
		else if launch_property == l_property.launch_side show_debug_message("SIDE")
		else if launch_property == l_property.bounce or character_stunned_state != stunned_state.none
		{
			character_stunned_state = stunned_state.bounce;
			vsp = -3;
			play_animation(bounce_floor_animation);
			if attacker != noone
			{
				attacker.rise_confirm = true;
				attacker.slow_gravity = 20;
			}
		}
	}
	launch_property = l_property.none
	//launch_property = l_property.none;
}

if got_hit and (invincible or sleeping or block_attack)
{
	launch_property = l_property.none;
	dmg_taken = 0;
	poise_dmg_taken = 0;
	got_hit = false;
	take_damage_type = "none"
}

//Launch Functions

//bounce on ground
if character_stunned_state == stunned_state.launch_up and vsp >= 0
{
	play_animation(launch_down_animation);
}

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
		play_animation(bounce_fall_animation);
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

//Dash
if character_dash and sprite_index = dash_end_animation
{
	hsp -= (get_delta_time()/2) * sign(hsp);
	if sign(hsp) != image_xscale
	{
		hsp = 0;
		character_dash = false;
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
			if my_action_buffer == action_input_buffer.jump and airstep_time <=0
			{my_action_buffer = action_input_buffer.none}
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
	//stop slide on wall
	if character_collision(Player_Object, false, false, true, false, false) == "wall"
	and airstep_time <= 0
	{
		show_debug_message("airstep time shouldnt be up at all")
		character_slide = false;
		slide_timer = 0;
		if collision_results != "none" character_action_set(stop_animation_01,0,0,10,15,true,true,false)
		else end_attack();
	}
	//stop slide when speed is insufficient
	if (abs(hsp) < max_walk_sp/2 or input_direction + image_xscale == 0) and character_slide
	{
		if abs(hsp) < max_walk_sp/2 and airstep_time > 0
		{show_debug_message("WHY")}
		else
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
	}
	//subtract slide speed once timer is out
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

//set variables if on the ground
var collision_results = character_collision(Player_Object, false, true, false, false)
if collision_results == "ground" or collision_results == "lslope" or collision_results == "rslope"
{
	airstep_wall = false;
	dash_allowed = true;
}

if !Player_Object
{
	if sign(hsp) == 0
	{
		facing_direction = image_xscale;
	}
	else
	{
		facing_direction = sign(hsp);
	}
}

//Timers
if mana_recharging
{
	mana_points += 0.1 * get_delta_time();
	mana_points = min(mana_points, max_mana_points);
	if mana_points == max_mana_points mana_recharging = false;
}

//Reset generic action for animator
current_generic_action = generic_actions.idle;

//INPUTS
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
	
	//Grabbing a ledge
	var block = instance_place(x +(input_direction * 4), y-24, o_t_solid);
	if block != noone
	and (key_up || input_direction != 0)
	and vsp >= 0
	and check_if_ground(3) == false
	and place_meeting(x, y + 16, o_t_solid) == false
	and place_meeting(x, y + vsp, o_t_solid) == false
	and check_special_action_states(1,1,1,1,1)
	and my_entity_state = entity_state.neutral
	and block.y > y - 32
	and block.y < y - 20
	{
		var ledge_viable = false;
		if input_direction == -1
		and x > block.x + 16
		{
			ledge_x = block.x + 16
			ledge_y = block.y
			ledge_viable = true;
			var facethisway = -1;
			airstep_wall = false;
			dash_allowed = true;
		}
		else if input_direction == 1
		and x < block.x
		{
			ledge_x = block.x
			ledge_y = block.y
			ledge_viable = true;
			var facethisway = 1;
			airstep_wall = false;
			dash_allowed = true;
		}
		
		var denyblock = instance_place(ledge_x + input_direction, ledge_y - 8, o_t_solid)
		if denyblock == noone
		and ledge_viable == true
		{
			var denyblock = instance_place (ledge_x + input_direction, ledge_y - 16, o_t_solid)
		}
	
			if denyblock == noone
			and ledge_viable == true
		{
			character_ledge_hold = true;
			character_action_set(ledge_grab_animation,0,0,100,100,false,false,false);
			image_xscale = facethisway;
			x = ledge_x;
			y = ledge_y;
			airstep_wall = false;
			dash_allowed = true;
		}
	}
	
	if character_ledge_hold and sprite_index != ledge_climb_animation
	{
		if key_jump or my_action_buffer == action_input_buffer.jump
		{
			my_action_buffer = action_input_buffer.none;
			jump_buffered = false;
			vsp = jump_height;
			end_attack();
			x += 12 * (image_xscale * -1);
			y += 32;
		}
		
		else if key_down and sprite_index != ledge_climb_animation
		{
		play_animation(idle_animation_01)
		end_attack()
		x += 12 * (image_xscale * -1);
		y += 32;
		}
		
		if key_up
		{
			play_animation(ledge_climb_animation);
			invincibility_anim_set(0,-1);
		}
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
					//vsp = max(jump_height * 1.4, jump_height - abs(hsp));
					vsp = jump_height * 1.1;
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
	
	if (((key_jump or my_action_buffer == action_input_buffer.jump) and !key_down) or airstep_time > 0 or character_ground_pound)
	and !check_if_ground(4) and (my_entity_state == entity_state.neutral or character_slide or character_ground_pound)
	and check_special_action_states(0,0,1,1,1)
	{
		if airstep_time <= 0 airstep_time = airstep_time_max;
		
		var block = instance_position(x + image_xscale * ((bbox_right - bbox_left)/2 + 1), y-8, o_t_solid);
		var enemy = instance_place(x + image_xscale, y, o_base_entity);
		var airstep_viable = false;
		
		if block != noone
		{
			if image_xscale == 1
			{
				ledge_x = block.x
			}
			if image_xscale == -1
			{
				ledge_x = block.x + 16
			}
		}
			
		if enemy != noone
		and y-8 < enemy.y
		and y+32 > enemy.y
		and !place_meeting(enemy.x, enemy.bbox_top + 2, o_t_solid)
		{ 
			airstep_wall = false;
			dash_allowed = true;
			airstep_viable = true;
			show_debug_message("ENEMY")
		}	
		
		else if
		block != noone
		and y - 10 > block.y
		and y -30 < block.y
		and !airstep_wall
		and !character_ground_pound
		{
			show_debug_message("WALL")
			if 
			(image_xscale == 1 and x <= ledge_x)
			or (image_xscale == -1 and x >= ledge_x)
			{
				airstep_wall = true;
				dash_allowed = true;
				x = ledge_x + (((bbox_right - bbox_left)/2) * image_xscale * -1);
				airstep_viable = true;
			}
		}
		
		
		if airstep_viable
		{
			if enemy != noone
			{
				play_animation(airstep_step_animation_01);
				y = enemy.bbox_top + 2;
				x = enemy.x;
				stepped_target = enemy;
				enemy.stepped_on = true;
				spawn_landing_effect(1)
			}
			else if block != noone
			{
				play_animation(airstep_step_animation_02);
			}
			character_action_set(sprite_index,0,0,15,15,false,false,false);
			character_air_step = true;
			character_ground_pound = false;
			character_slide = false;
			airstep_step_time = airstep_step_time_max;
		}
	}
	
	if key_jump and key_down and !check_if_ground(4)
	and (my_entity_state == entity_state.neutral or check_special_action_states(1,0,1,1,1))
	{
		character_action_set(s_player_dive_start,0,-1,0,0,false,true,false);
		vsp = -3
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
	
	//subtract from airstep timers and make happen when sufficient
	if airstep_time > 0 airstep_time -= get_delta_time();
	if airstep_step_time > 0 airstep_step_time -= get_delta_time();
	if airstep_step_time <= 0 and character_air_step
	{
		character_air_step = false;
		var force_high_jump = false;
		if key_left and !key_right
		{
			if airstep_wall == true and x > ledge_x
			{
				force_high_jump = true;
			}
			else
			{
				character_action_set(slide_jump_animation_01,0,jump_height*0.9, 15, 15, true, true, false);
				hsp = input_direction * 4;
				image_xscale = sign(hsp);
			}
		}
	
		if !key_left and key_right
		{
			if airstep_wall == true and x < ledge_x
			{
				force_high_jump = true;
				show_debug_message(ledge_x)
			}
			else 
			{
				character_action_set(slide_jump_animation_01,0,jump_height*0.9, 15, 15, true, true, false);
				hsp = input_direction * 4;
				image_xscale = sign(hsp);
			}
		}
	
		if (!key_left and !key_right) or force_high_jump
		{
			character_action_set(slide_jump_animation_02,0,jump_height*0.85, 15, 15, true, true, false);
		}
		reset_animation = sprite_index;
	}
}



//Pop up when you hit an enemy and pop up with them
if slow_gravity > 0
{
	/*if rise_confirm
	{
		vsp = -2.5;
		rise_confirm = false;
	}*/
	
	if rise_attack
	{
		slow_gravity -= get_delta_time();
		slow_gravity = max(0,slow_gravity);
		if rise_confirm vsp = rise_vsp; //-2.5 is a good base value
	}
	else slow_gravity = 0;
	rise_confirm = false;
}

if rise_attack and action_min_time <= 0
{
	rise_attack = false;
	slow_gravity = 0;
}