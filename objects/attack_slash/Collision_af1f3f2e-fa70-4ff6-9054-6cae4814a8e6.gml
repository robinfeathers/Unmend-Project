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
	if character_hit.character_magic_guard and damage_type == "magical"
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
			creator.pulse_points += 200;
			with character_hit
			{
			dmg_taken = other.dmg;
			poise_dmg_taken = other.poise_dmg;
			got_hit = true;
			attacker = other.creator
			take_damage_type = other.damage_type
			}
			if character_hit.x > x character_hit.hit_direction = -1;
			else character_hit.hit_direction = 1;
			if character_hit.invincible == false and character_hit.sleeping == false
			{
				damage_angle = point_direction(
				creator.bbox_right-((creator.bbox_right-creator.bbox_left)/2),
				creator.bbox_bottom-((creator.bbox_bottom-creator.bbox_top)/2),
				character_hit.bbox_right-((character_hit.bbox_right-character_hit.bbox_left)/2),
				character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2));
				var hit_effect = instance_create_depth(character_hit.x, character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2), 8, o_sword_hitFX01)
				with hit_effect
				{
					hit_angle = other.damage_angle;
					part_amount = round(other.dmg/10);
					event_user(0);
				}
				var poise_part_amount = (poise_dmg / character_hit.poise_max) * 10;
				var hit_effect = instance_create_depth(character_hit.x, character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2), 8, o_sword_hitFX02)
				with hit_effect
				{
					part_amount = round(poise_part_amount);
					event_user(0);
				}
				instance_create_depth(character_hit.x, character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2), 8, cut_impact);
				var grow = instance_create_depth(character_hit.x, character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2), 8, grow_effect)
				with (grow)
				{
					max_scale = .5;
					growth_rate = .1;
					max_alpha = .4;
					sprite_index = s_glow;
				}
			}
			if character_hit.poise <= 0 or character_hit.poise - poise_dmg <= 0
			{
				instance_create_depth(character_hit.x, character_hit.bbox_bottom-((character_hit.bbox_bottom-character_hit.bbox_top)/2), 8, hit_ring);
			}
			if crowd_control_property = cc_properties.l_up
			{
				character_hit.launch_property = l_property.launch_up
			}
			if crowd_control_property = cc_properties.l_down
			{
				character_hit.launch_property = l_property.launch_down
			}
			if crowd_control_property = cc_properties.l_side
			{
				character_hit.launch_property = l_property.launch_side
			}
			if crowd_control_property = cc_properties.bounce
			{
				character_hit.launch_property = l_property.bounce
			}
		}
	}
}