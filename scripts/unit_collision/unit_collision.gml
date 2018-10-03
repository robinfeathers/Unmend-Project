var starting_x = other.x
var prefered_target = noone;

var _list = ds_list_create()
var collision_units = instance_place_list(x, y, Enemy, _list, true)

//Code to check for the player too
/*
if argument[0] == false
{
	var player_unit = instance_place(x,y,o_player)
	if player_unit != noone
	{
		ds_list_add(_list,player_unit)
		collision_units += 1;
		show_debug_message("Bugoo")
	}
}
*/

if collision_units > 0
{
	for (var i = 0; i < collision_units; ++i;)
	{
		var relative_x = abs(starting_x - (_list[| i]).x)
		
		if prefered_target == noone prefered_target = (_list[| i]);
		
		if  relative_x <= (abs(starting_x - prefered_target.x))
		{
			prefered_target = (_list[| i]);
		}
	}
}

if prefered_target != noone
{
	if starting_x > prefered_target.x
	{
		other.x += 1;
	}

	if starting_x < prefered_target.x
	{
		other.x += -1;
	}

	if starting_x == prefered_target.x
	{
		if other > prefered_target
		{
			other.x += 1;
		}
		else
		{
			other.x += -1;
		}
	}
}

ds_list_destroy(_list)