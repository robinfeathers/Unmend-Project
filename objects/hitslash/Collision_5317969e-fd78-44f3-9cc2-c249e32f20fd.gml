/// @description what happens when you hit an enemy.
if reset_allowance > 0
and
(
	(sprite_index == s_player_slideattack_fx and image_index > 5)
	|| (sprite_index == s_player_air03_alt_fx and image_index > 2)
	|| (sprite_index == s_firespell_main and abs(angle) > 6)
)
{
	enemies_hit = 0;
	for(i=0; i<array_length_1d(enemies_hit); i++)
	enemies_hit[i] = 0;
	reset_allowance -= 1;
	show_debug_message("RESET")
}
if image_index < (image_number *.75)
	{
	var enemyhit = other.id;
	var do_nothing = false;
	var i;
	if enemyhit != creator
	{
		//Check if we've hit the enemy before
		for(i=0; i<array_length_1d(enemies_hit); i++)
		{
			if(enemies_hit[i] == enemyhit)
			do_nothing = true;
		}
		//If not then hit it.
		if do_nothing = false
		{
			enemies_hit[enemylistindex] = enemyhit;
			enemylistindex += 1;
			enemyhit.shake = 2;
			if enemyhit.sleeping == false
			enemyhit.dmg_taken = dmg;
			enemyhit.poisedmg_taken = poisedmg;
			enemyhit.got_hit = true;
			//check if properties need to be applied to the enemy
			if attack_properties == hit_properties.launch_up
			{
				enemyhit.dmg_response = hurt_properties.launchup;
			}
			if attack_properties == hit_properties.launch_down
			{
				enemyhit.dmg_response = hurt_properties.launchdown;
			}
			if attack_properties == hit_properties.launch_horizontal
			{
				enemyhit.dmg_response = hurt_properties.launchhorizontal;
				enemyhit.hit_direction = image_xscale;
			}
			if attack_properties == hit_properties.bounce
			{
				enemyhit.dmg_response = hurt_properties.hitbounce;
			}
		}
	}
}