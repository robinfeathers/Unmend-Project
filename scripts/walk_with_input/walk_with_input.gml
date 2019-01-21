/// @desc update the position of an object, detecting if in the air or not.

// Change hsp with nuance
if ((input_direction == 1) || (input_direction == -1))
{
	if check_if_ground(0) == true
	{
		if abs(hsp) <= max_walk_sp
		{
			//hsp = (hsp * input_direction) + walk_sp *;
			hsp += walk_sp * get_delta_time() * input_direction;
		}
		if abs(hsp) > max_walk_sp
		{
			hsp = max_walk_sp * input_direction;
		}
	}
	if check_if_ground(0) == false
	{
		if abs(hsp) <= max_air_sp
		{
			//hsp = (hsp * input_direction) + walk_sp;
			hsp += walk_sp * get_delta_time() * input_direction;
		}
		if abs(hsp) > max_air_sp
		{
			hsp = max_air_sp * input_direction;
		}
	}
	//hsp = (hsp * sign(input_direction);
	current_generic_action = generic_actions.run;
}

//make speed decay
else
{
	//if speed is above 0 and you are allowed to move
	if  (abs(hsp) > 0)
	{
		var abs_hsp = abs(hsp);
		//Speed subtract
		abs_hsp -= (stop_sp) * get_delta_time();
		if abs_hsp > 0
		{
			//set hsp to speed
			hsp = abs_hsp * sign(hsp);
		}
		else
		{
			hsp = 0;
		}

	}
	
	else
	{
		hsp = 0;
	}
}
