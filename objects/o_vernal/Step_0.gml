/// @description Run's Before Parent's End Step
event_inherited();

//INPUT BASED UNIQUE PLAYER ACTIONS
//Normal Attacks
if (key_attack or my_action_buffer == action_input_buffer.n_attack)
and my_entity_state == entity_state.neutral
{
	//Neutral Attacks
	if my_direction_buffer == direction_input_buffer.neutral
	{
			//3 Hit Combo
			character_action_set(s_player_ground01, 0.5, 0, 23, 40, true, false)
			character_slash_set(s_player_ground01_fx, 2, create_slash_cc.none, true, 2, 2, 0, 0, false, 0, false)
	}
	//Up Attacks
	if my_direction_buffer == direction_input_buffer.up
	{
			
	}
	//Down Attacks
	if my_direction_buffer == direction_input_buffer.down
	{
			
	}
}