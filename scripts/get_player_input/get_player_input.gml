//MUST BE UPDATED
//Needs to accomodate for both custom controls AND swapping between keyboard and gamepad
key_restart = gamepad_button_check_pressed(0,gp_select)
if
keyboard_check(vk_left)
|| keyboard_check(vk_right)
|| keyboard_check(vk_up)
|| keyboard_check(vk_down)
|| keyboard_check_pressed(vk_space)
|| keyboard_check_pressed(vk_shift)
|| keyboard_check_pressed(ord("D"))
|| keyboard_check_pressed(ord("S"))
{
	controller = false;
}
else if
gamepad_button_check_pressed(0,gp_face1)
|| gamepad_button_check_pressed(0,gp_face2)
|| gamepad_button_check_pressed(0,gp_face3)
|| gamepad_button_check_pressed(0,gp_face4)
|| gamepad_button_check_pressed(0,gp_shoulderr)
|| abs(min(gamepad_axis_value(0,gp_axislh),0)) > 0.5
|| max(gamepad_axis_value(0,gp_axislh),0) > 0.5
|| abs(min(gamepad_axis_value(0,gp_axislv),0)) > 0.5
|| max(gamepad_axis_value(0,gp_axislv),0) > 0.5
{
	controller = true;
}
	
if controller == false
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_up = keyboard_check(vk_up);
	key_down = keyboard_check(vk_down);
	key_jump = keyboard_check_pressed(vk_space);
	key_jump_held = keyboard_check(vk_space);
	key_dodge = keyboard_check_pressed(vk_shift);
	key_grab = keyboard_check_pressed(ord("A"));
	key_attack = keyboard_check_pressed(ord("D"));
	key_specialattack = keyboard_check_pressed(ord("S"));
}
else
{
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	if key_left > 0.5 key_left = 1
	else key_left = 0
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	if key_right > 0.5 key_right = 1
	else key_right = 0
	key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
	if key_up > 0.5 key_up = 1
	else key_up = 0
	key_down = max(gamepad_axis_value(0,gp_axislv),0);
	if key_down > 0.5 key_down = 1
	else key_down = 0
	key_jump = gamepad_button_check_pressed(0,gp_face1);
	key_jump_held = gamepad_button_check(0,gp_face1);
	
	key_attack = gamepad_button_check_pressed(0,gp_face3);
	key_grab = gamepad_button_check_pressed(0,gp_face2);
	key_specialattack = gamepad_button_check_pressed(0,gp_face4);
	key_dodge = gamepad_button_check_pressed(0,gp_shoulderr);
}

if my_entity_state == entity_state.acting
//and lockout_time < 12
//and !diving

//MISSING: Need to redo inputs on dodge since they're the only directional based actions
{
	//ActionBuffers
	if key_jump == true
	{
		my_action_buffer = action_input_buffer.jump
	}
	//else if key_jump == true and key_down and !stinger
	//{
		//mybuffer = buffer_input.dive
	//}
	//else if key_dodge == true and my_direction == 0
	//{
		//mybuffer = buffer_input.backstep
	//}
	else if key_dodge == true and my_direction != 0
	{
		my_action_buffer = action_input_buffer.dodge
	}
	else if key_grab
	{
		my_action_buffer = action_input_buffer.grab
	}
	else if key_attack
	{
		my_action_buffer = action_input_buffer.n_attack
	}
	else if key_specialattack
	{
		my_action_buffer = action_input_buffer.s_attack
	}
	//Input buffers
	my_direction_buffer = direction_input_buffer.neutral;
	if key_left or key_right and (!key_down or !key_up)
	{
		my_direction_buffer = direction_input_buffer.neutral
	}
	if key_up
	{
		my_direction_buffer = direction_input_buffer.up
	}
	if key_down
	{
		my_direction_buffer = direction_input_buffer.down
	}
}

if key_restart game_restart();

input_direction = key_right - key_left;