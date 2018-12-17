/// @desc Takes place before child step event
//Damage Taking Events
if got_hit
{
	if !invincible and !sleeping
	{
		got_hit = false;
		shake = 2;
		hp -= max(0,dmg_taken)
		poise -= max(0,poise_dmg_taken)
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
	if my_entity_state == entity_state.acting
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