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
	{
	walk_with_input();
	}
	
	if key_jump
	{
		if check_if_ground(7) and my_entity_state == entity_state.neutral
		{
			vsp = jump_height;
		}
	}
	
}