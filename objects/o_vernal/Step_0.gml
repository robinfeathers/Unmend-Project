/// @description Run's Before Parent's End Step
event_inherited();

//MISSING: Unspammable attacks, prevents reuse until combo ends or new move is used

//INPUT BASED UNIQUE PLAYER ACTIONS
//Normal Attacks
if (key_attack or my_action_buffer == action_input_buffer.n_attack)
and my_entity_state == entity_state.neutral
{
	//Neutral Attacks
	if my_direction_buffer == direction_input_buffer.neutral
	{
		//3 Hit Combo ground
		if check_if_ground(1)
		{
			if combo_counter == 0
			{
				combo_counter += 1
				character_action_set(s_player_ground01, 0.5, 0, 20, 30, true, false, false)
				character_slash_set(s_player_ground01_fx, 2, create_slash_p.none, true, 200, 200, 0, 0, false, 0, false)
			}
			else if combo_counter == 1
			{
				combo_counter += 1
				character_action_set(s_player_ground02, 0.5, 0, 20, 30, true, false, false)
				character_slash_set(s_player_ground02_fx, 2, create_slash_p.none, true, 200, 200, 0, 0, false, 0, false)
			}
			else if combo_counter == 2
			{
				combo_counter += 1
				character_action_set(s_player_ground03, 0.75, 0, 30, 40, true, false, false)
				character_slash_set(s_player_ground03_fx, 5, create_slash_p.none, true, 400, 500, 0, 0, false, 0, false)
			}
		}
		else
		{
			if combo_counter == 0
			{
				combo_counter += 1
				character_action_set(s_player_air01, 0.5, 0, 20, 25, true, false, false)
				character_slash_set(s_player_air01_fx, 2, create_slash_p.none, true, 200, 200, 0, 0, false, 0, false)
			}
			else if combo_counter == 1
			{
				combo_counter += 1
				character_action_set(s_player_air02, 0.5, 0, 20, 25, true, false, false)
				character_slash_set(s_player_air02_fx, 2, create_slash_p.none, true, 200, 200, 0, 0, false, 0, false)
			}
			else if combo_counter == 2
			{
				combo_counter += 1
				character_action_set(s_player_air03, 0.75, 0, 25, 30, true, false, false)
				character_slash_set(s_player_air03_fx, 5, create_slash_p.none, true, 400, 500, 0, 0, false, 0, false)
			}
		}
			
	}
	//Up Attacks
	else if my_direction_buffer == direction_input_buffer.up or key_up
	{
		if check_if_ground(1) 
		{
			if disallowed_action != s_player_launch
			{
				show_debug_message(disallowed_action)
				character_action_set(s_player_launch, 0.5, 0, 30, 45, true, false, true);
				character_slash_set(s_player_launch_fx, 2, create_slash_p.l_up,true, 300, 300, 0, 0, false, 0, false);
				combo_counter = 0;
			}
		}
	}
	//Down Attacks
	else if my_direction_buffer == direction_input_buffer.down  or key_down
	{
			
	}
}

//Special Attacks
if (key_specialattack or my_action_buffer == action_input_buffer.s_attack)
and my_entity_state == entity_state.neutral
{
	//Base Pulse
	if pulse_points < pulse_points_requirement and disallowed_action != s_player_pulse_neutral
	{
		character_action_set(s_player_pulse_neutral, 0, 0, 35, 40, true, false, true);
		character_prep_pulse(-4,-39,1);
		show_debug_message(my_action_buffer)
	}
	//Neutral Attacks
	if my_direction_buffer == direction_input_buffer.neutral
	{	
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

var index = image_index;
spawn_pulse(index);