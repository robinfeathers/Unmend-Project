//Combat and Actions
if create_slash character_create_slash(image_index);

if action_min_time > 0 and my_entity_state == entity_state.acting
{
	action_min_time -= get_delta_time();
}
if action_max_time > 0
{
	action_max_time -= get_delta_time();
}

if action_min_time <= 0 and !action_await
and my_entity_state == entity_state.acting and my_entity_state != entity_state.stunned
and check_special_action_states(1,1,1,1,1)
{
	my_entity_state = entity_state.neutral;
	action_min_time = 0;
	attack_hsp = 0;
	hsp = 0;
	slash_created = false;
	gravity_allowed = true;
}
if action_max_time <= 0 and my_entity_state != entity_state.stunned
and check_special_action_states(1,1,1,1,1)
{
	end_attack();
	my_entity_state = entity_state.neutral;
}

//Collision and Movement
if gravity_allowed and character_collision(Player_Object, false, true, false, false) == "none"
{
	character_gravity(Player_Object);
	current_generic_action = generic_actions.jump;
}
if !gravity_allowed and !check_if_ground(abs(hsp)+1) and my_entity_state == entity_state.acting
{
	vsp = min(vsp,0.2)
}
character_collision(Player_Object, false, false, false, false);

//ANIMATOR
if my_entity_state == entity_state.neutral
{
	if current_generic_action = generic_actions.idle
	and sprite_index != stop_animation_01
	and sprite_index != air_rise_animation
	and sprite_index != air_arc_animation
	and sprite_index != air_fall_animation
	and sprite_index != land_idle_animation
	and sprite_index != turn_idle_animation
	and sprite_index != turn_run_animation
	and sprite_index != reset_animation
	and !play_stop_animation
	{
		play_animation(idle_animation_01);
		
	}
	
	//Run Animations
	if current_generic_action == generic_actions.run
	and sprite_index != land_run_animation
	and sprite_index != turn_idle_animation
	and sprite_index != turn_run_animation
	{
		play_animation(run_animation);
		stop_animation_delay = 0;
		play_stop_animation = false;
	}
	
	//Stop Animations
	if previous_generic_action = generic_actions.run
	and current_generic_action = generic_actions.idle
	and anim_allow_stop = true
	and sprite_index != turn_idle_animation
	and sprite_index != turn_run_animation
	{
		stop_animation_delay = stop_animation_delay_time;
		play_stop_animation = true;
	}
	
	if stop_animation_delay > 0 and play_stop_animation
	{
		stop_animation_delay -= get_delta_time();
	}
	if stop_animation_delay <= 0 and play_stop_animation
	{
		play_animation(stop_animation_01);
		reset_animation = stop_animation_01
		play_stop_animation = false;
	}
	
	//Turn Animations
	if previous_generic_action = generic_actions.idle
	and current_generic_action = generic_actions.run
	and facing_direction != image_xscale
	{
		if abs(hsp) <= 1
		and anim_allow_turn_idle
		{
			disallow_turning = true;
			play_stop_animation = false;
			play_animation(turn_idle_animation);
			reset_animation = turn_idle_animation
		}
		if abs(hsp) > 1
		and anim_allow_turn_run
		{
			disallow_turning = true;
			play_stop_animation = false;
			play_animation(turn_run_animation);
			reset_animation = turn_run_animation
		}
	}
	
	//Jump Animations
	if current_generic_action == generic_actions.jump
	{
		if (vsp < 0)
		and (vsp <= fall_anim_delay)
		and sprite_index != air_rise_animation
		and sprite_index != slide_jump_animation_02
		{
			play_animation(air_rise_animation);
		}
		if (vsp >= fall_anim_delay)
		{
			if vsp > 2.5
			{
				play_animation(air_fall_animation);
			}
			else if anim_allow_arc play_animation(air_arc_animation);
		}
		
	}
	
	//Landing Animations
	if current_generic_action == generic_actions.idle
	and previous_generic_action == generic_actions.jump
	and anim_allow_land_idle
	{
		play_land_animation = true;
		play_animation(land_idle_animation);
		reset_animation = land_idle_animation
	}
	if current_generic_action == generic_actions.run
	and previous_generic_action == generic_actions.jump
	and anim_allow_land_run
	{
		play_land_animation = true;
		play_animation(land_run_animation);
		reset_animation = land_run_animation
	}
	if current_generic_action == generic_actions.idle
	and previous_generic_action == generic_actions.jump
	and (!anim_allow_land_idle
	or !anim_allow_land_run)
	{
		play_animation(idle_animation_01);
	}
	
	//For turning the player handling.
	if sprite_index != turn_idle_animation or turn_run_animation or reset_animation
	{
		disallow_turning = false;
	}
	
	if !disallow_turning
	{
		image_xscale = facing_direction;
	}
	
	//ALWAYS END THE CODE WITH THIS
	previous_generic_action = current_generic_action;
}
else 
{
	play_stop_animation = false;
	previous_generic_action = generic_actions.idle;
	current_generic_action = generic_actions.idle;
}
//Shaking
if shake > 0
{
	shake -= 0.5* get_delta_time();
}
else
{
	shake = 0;
}

character_debug = false;