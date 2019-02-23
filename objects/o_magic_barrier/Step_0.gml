x = owner.bbox_right - ((owner.bbox_right - owner.bbox_left)/2)
y = owner.bbox_bottom - 4 -((owner.bbox_bottom-owner.bbox_top)/2)

if got_hit
{
	got_hit = false;
	image_index = 1;
	image_speed = 1;
	//SPAWN ORBS IF THERE IS NOT ENOGUGH TO MATCH THE REQUIREMENT
	//SPAWN THEM DEPENDING ON A FRACTION OF damage_absorbed_cap/damage_absorbed
	//ALSO I HAVEN'T ACTUALLY MADE THEM YET BUT "s_shieldpulse"is the sprite for them and 163:20:70 is the rgb value for the particles behind them.
}

if owner.character_magic_guard == false
{
	//CODE FOR DIFFERENT WAYS OF BREAKING SHIELD
	if damage_absorbed > 0
	{
		if absorb_mana
		{
			with owner
			{
				mana_points += floor(other.damage_absorbed/4);
				mana_points = min(mana_points,max_mana_points);
				show_debug_message(other.damage_absorbed)
			}
			
			//EFFECT FOR ABSORBING ORBS AND SHIT GOES HERE
		}
		else
		{
			//EFFECT FOR EXPLOSION GOES HERE
			//Just set absorb mana to false in the create event cause I'm still thinking of how to code this part
			with o_base_entity
			{
				if distance_to_object(other) <= 48 and Enemy_Object
				{
					got_hit = true;
					dmg_taken = other.damage_absorbed;
					poise_dmg_taken = other.damage_absorbed/2;
					attacker = other.owner
					take_damage_type = "magical"
					
					instance_create_depth(x, bbox_bottom-((bbox_bottom-bbox_top)/2), 8, cut_impact);//CHANGE TO MAGIC
					var grow = instance_create_depth(x, bbox_bottom-((bbox_bottom-bbox_top)/2), 8, grow_effect)
					with (grow)
					{
						max_scale = .5;
						growth_rate = .1;
						max_alpha = .4;
						sprite_index = s_glow;
					}
				}
			}
		}
	}
	else
	{
		//EFFECT FOR JUST SHRINKING AWAY PATHETICALLY
	}
	//DEFAULT ACTION
	instance_destroy();
}

