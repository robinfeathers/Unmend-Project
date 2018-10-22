event_inherited();

/*

//ACTION WALK BACKWARDS
var dir = 0;
if x > o_player.x
{
	dir = 1;

}
else
{
	dir = -1;

}
sprite_index = walk_sprite;
image_xscale = dir * -1;
hsp = walksp * dir * get_delta_time();

*/

/*

//ACTION WALK FORWARDS
var dir = 0;
if x > o_player.x
{
	dir = -1;

}
else
{
	dir = 1;

}
sprite_index = walk_sprite;
image_xscale = dir;
hsp = walksp * dir * get_delta_time();

*/



//DASH DANCE
if dash_occur = true and dash_amount != 0
{
	if dash_first
	{
		if random_range(1,10) > 5 dash_direction = 1
		else dash_direction = -1;
		dash_first = false;
		dash_amount = random_range(3,7)
	}
	else dash_direction *= -1;

	vsp = -2;
	hsp = 2 * dash_direction;
	y -= 2;
	dash_occur = false;
}

if place_meeting(x+hsp,y+1,o_t_solid)
{
	dash_occur = true;
	dash_amount -= 1;
}	

var dir = 0;
if x > o_player.x
{
	dir = -1;
}
else
{
	dir = 1;
}
image_xscale = dir;

hsp = 2 * dash_direction
vsp += get_delta_time() * 0.2;

if dash_amount <= 0
{
	hsp = 0;
	dash_occur = false;
}

