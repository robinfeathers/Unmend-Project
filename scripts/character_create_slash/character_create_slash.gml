///@arg image_index
if  floor(argument[0]) == create_slash_starting_frame
{
	create_slash = false;
	slash_created = true;
	var inst;
	inst = instance_create_depth(x,y,8,attack_slash)
	with inst
	{
		creator = other.id
		//REMEMBER THIS SHIT WHEN RECODING THE SLASH YOU FUCKER
		if other.Player_Object = true
		{
			faction = slash_faction.player
		}
		else if other.Enemy_Object = true
		{
			faction = slash_faction.enemy
		}
		else if other.Ally_Object = true
		{
			faction = slash_faction.ally
		}
		
		sprite_index = other.create_slash_sprite;
		//NAME IT cc_properties!!!
		crowd_control_property = other.create_slash_attack_properties;
		follow_creator = other.create_slash_follow_character;
		dmg = other.create_slash_dmg;
		poise_dmg = other.create_slash_poise_dmg;
		starting_frame = other.create_slash_start_action;
		hit_count = other.create_slash_hit_count;
		hit_delay = other.create_slash_hit_delay;
		base_hit_delay = other.create_slash_hit_delay;
		continuous_action = other.create_slash_continuous_action;
		
		hsp = other.hsp;
		vsp = other.vsp;
		image_xscale = other.image_xscale;
		mask_index = sprite_index;
	}
}