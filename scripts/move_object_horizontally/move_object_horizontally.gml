/// @desc update the position of an object, detecting if in the air or not.

// Change hsp with nuance
if ((my_direction == 1) || (my_direction == -1))
{
	if check_if_ground(0) == true
	{
		if abs(hsp) <= max_hsp
		{
			hsp = (hsp * my_direction) + walksp;
		}
		if abs(hsp) > max_hsp
		{
			hsp = max_hsp;
		}
	}
	if check_if_ground(0) == false
	{
		if abs(hsp) <= max_airhsp
		{
			hsp = (hsp * my_direction) + walksp;
		}
		if abs(hsp) > max_airhsp
		{
			hsp = max_airhsp;
		}
	}
	hsp = (hsp * get_delta_time()) * sign(my_direction);
}

//make speed decay
else
{
	//if speed is above 0 and you are allowed to move
	if  (abs(hsp) > 0)
	{
		var abs_hsp = abs(hsp);
		//Speed subtract
		abs_hsp -= (stopsp) * get_delta_time();
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
		hsp = 0
	}
}
