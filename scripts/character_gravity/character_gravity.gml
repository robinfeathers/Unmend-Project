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
	if my_entity_state == entity_state.stunned vsp += weight * get_delta_time()/2;
	else vsp += weight * get_delta_time();
}

//make character fall at a certain rate and cap the player's fall speed
else if (vsp >= 0) and (vsp < max_fallsp)
{
	vsp += (weight * gravity_resistance) * get_delta_time();
	if my_entity_state == entity_state.stunned vsp = min(max_fallsp/1.5,vsp);
}
else
{
	vsp = max_fallsp
}