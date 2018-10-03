/// @desc apply_gravity(isplayer)
/// @arg Is player?
grv = .55;
player_resistance = 1;

//Nuetral gravity application
if lockout_time <= 0
{
	
	if lockwalk_time <= 0
	{
		reset_attack()
	}
	//Slow Descent if player is holding jump
	if argument[0] == true
	{
		if (key_jump = true) and (vsp > 0)
		{
			player_resistance = .5;
		}
		else if (key_jump = false) and (vsp > 0)
		{
			player_resistance = 1;
		}
	}
	//slow the player during their ascent
	if vsp < 0
	{
		vsp += (grv) * get_delta_time();
	}
	//make them fall at a certain rate and cap the player's fall speed
	else if (vsp >= 0) and (vsp < max_fallsp)
	{
		vsp += (grv * player_resistance) * get_delta_time();
	}
	else
	{
		vsp = max_fallsp// * get_delta_time();
	}
}

//Gravity application during specific actions
if lockout_time > 0
{
	if backstep || stinger || slide_stopping
	{
		vsp = max_fallsp / 2;
	}
	else
	{
		vsp = .2
	}
}


