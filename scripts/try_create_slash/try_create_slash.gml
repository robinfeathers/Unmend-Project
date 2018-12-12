///@description Every frame try and see if the player is on a frame of animation where they can spawn a hitslash
///@arg image_index

var inst = noone;
var facethisway = sign(image_xscale);

//BASIC COMBO #1
if (sprite_index == s_player_ground01)
and (floor(argument[0]) == 2)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_ground01_fx;
	}
}

//BASIC COMBO #2
if (sprite_index == s_player_ground02)
and (floor(argument[0]) == 2)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_ground02_fx;
	}
}

//BASIC COMBO #3
if (sprite_index == s_player_ground03)
and (floor(argument[0]) == 5)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_ground03_fx;
	}
}

//BASIC LAUNCH
if (sprite_index == s_player_launch)
and (floor(argument[0]) == 3)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_launch_fx;
		attack_properties = hit_properties.launch_up
	}
}

//STINGER ATTACK
if (sprite_index == s_player_stingerattack)
and (floor(argument[0]) == 0)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_stinger_fx;
		attack_properties = hit_properties.launch_horizontal
	}
}

//SLIDE ATTACK
if (sprite_index == s_player_slideattack)
and (floor(argument[0]) == 1)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		reset_allowance = 1;
		sprite_index = s_player_slideattack_fx;
	}
}

//BASIC AIR COMBO #1
if (sprite_index == s_player_air01)
and (floor(argument[0]) == 2)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_air01_fx;
	}
}

//BASIC AIR COMBO #2
if (sprite_index == s_player_air02)
and (floor(argument[0]) == 2)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_air02_fx;		
	}
}

//BASIC AIR COMBO #3
if (sprite_index == s_player_air03)
and (floor(argument[0]) == 5)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_air03_fx;		
		attack_properties = hit_properties.launch_down
	}
}

//AIR COMBO ALT FINISH
if (sprite_index == s_player_air03_alt)
and (floor(argument[0]) == 5)
and (lockout_time > 0)
and (slashcreated == false)
{
	vsp = -3.2;
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		reset_allowance = 1;
		sprite_index = s_player_air03_alt_fx;		
	}
}

//FIRE MAGIC
if (sprite_index == s_player_magic_circle)
and (floor(argument[0]) == 1)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		reset_allowance = 1;
		intended_radius = 28;
		rotation_speed = -0.35 * other.intended_direction;
		origin_x = other.x
		origin_y = other.y - 16
		sprite_index = s_firespell_main;
	}
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		reset_allowance = 1;
		intended_radius = -28;
		rotation_speed = -0.35 * other.intended_direction;
		origin_x = other.x
		origin_y = other.y - 16
		sprite_index = s_firespell_main;
	}
}

//DIVE CUT
if (sprite_index == s_player_divecut_fall)
and (floor(argument[0]) == 0)
and (lockout_time > 0)
and (slashcreated == false)
{
	slashcreated = true;
	var inst;
	inst = instance_create_depth(x,y,8,hitslash)
	with (inst)
	{
		sprite_index = s_player_divecut_fall_fx;		
		attack_properties = hit_properties.launch_down
	}
}

//Set Slash Properties
with (inst)
{
	hsp = other.hsp;
	vsp = other.vsp;
	dmg = other.dmg;
	poisedmg = other.poisedmg;
	image_xscale = facethisway;
	mask_index = sprite_index;
}