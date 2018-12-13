/// @desc Takes place before child step event

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
	
	if my_entity_state == entity_state.neutral
	and action_max_time <= 0
	{
	walk_with_input();
	}
	if my_entity_state == entity_state.acting
	{
		hsp = attack_hsp * input_direction;
	}
	
	if key_jump or my_action_buffer == action_input_buffer.jump
	{
		if check_if_ground(7) and (my_entity_state == entity_state.neutral or action_min_time <= 0)
		{
			vsp = jump_height;
			end_attack();
		}
	}
	if vsp < jump_height / 3
	and !key_jump_held
	and my_entity_state == entity_state.neutral
	{
		vsp = jump_height / 3;
	}
	
}