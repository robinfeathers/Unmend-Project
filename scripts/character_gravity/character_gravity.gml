/// @desc character_gravity(player_object)
/// @arg Is this a player object?

/*WHAT'S MISSING: IN THE NEW VERSION
LOCKOUT TIME
RESETTING THE ATTACK COMBO
*/

//apply resistance to player_object if jump key is held
if argument[0] = true
{
	if key_jump = true and vsp > 0
	{
		gravity_resistance = 0.5;
	}
	else
	{
		gravity_resistance = 1;
	}
}

//slow the character during their ascent
if vsp < 0
{
	vsp += weight * get_delta_time();
}

//make character fall at a certain rate and cap the player's fall speed
else if (vsp >= 0) and (vsp < max_fallsp)
{
	vsp += (weight * gravity_resistance) * get_delta_time();
}
else
{
	vsp = max_fallsp
}