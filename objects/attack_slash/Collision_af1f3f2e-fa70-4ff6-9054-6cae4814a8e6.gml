if hit_count > 0
{
	if hit_delay > 0
	{
		hit_delay -= get_delta_time;
	}
	else
	{
		hit_delay = base_hit_delay;
		hit_count -= 1
		
		character_hit = 0;
		for(i=0; i<array_length_1d(character_hit); i++)
		character_array[i] = 0;
	}
}

if floor(image_index) <= starting_frame
{
	var character_hit = other.id;
	var do_nothing = false;
	var i;
	var ignore_character = false;
	
	//CHECK IF OBJECT IS IN THE SAME FACTION OR NOT
	if slash_alliance == slash_faction.player
	and character_hit.character_alliance == alliance_group.player
	{
		ignore_character = true;
	}
	if slash_alliance == slash_faction.enemy
	and character_hit.character_alliance == alliance_group.enemy
	{
		ignore_character = true;
	}
	if slash_alliance == slash_faction.ally
	and character_hit.character_alliance == alliance_group.ally
	{
		ignore_character = true;
	}
	
	if character_hit != creator
	and !ignore_character
	{
		for(i=0; i<array_length_1d(character_array); i++)
		{
			if character_array[i] == character_hit do_nothing = true;
		}
		if !do_nothing
		{
			character_array[character_listindex] = character_hit;
			character_listindex += 1;
			character_hit.shake = 2;
			//MISSING ADD THESE VARIABLES TO THE CHARACTER OBJECT
			dmg_taken = dmg;
			poise_dmg_taken = poise_dmg;
			got_hit = true;
			if crowd_control_property = cc_properties.l_up
			{
				character_hit.launch_property = cc.launch_up
			}
			if crowd_control_property = cc_properties.l_down
			{
				character_hit.launch_property = cc.launch_down
			}
			if crowd_control_property = cc_properties.l_side
			{
				character_hit.launch_property = cc.launch_side
			}
			if crowd_control_property = cc_properties.bounce
			{
				character_hit.launch_property = cc.bounce
			}
		}
	}
}