//@arg how far to check below slopes

var slope_colliding = false;
var r_slope = instance_place(x,y+8,o_t_solid_r_slope);
var l_slope = instance_place(x,y+8,o_t_solid_l_slope);

if (place_meeting(x,y+2,o_t_solid))
{
	return true;
}

else if r_slope != noone
{
	slope_colliding = true;
	var local_slope = ((r_slope.y+16)-r_slope.y)/((r_slope.x+16)-r_slope.x);
	var test_y = x - (r_slope.x * local_slope) + r_slope.y;
	if y+1+argument[0] > test_y
	{
		return true;		
	}
	else 
	{
		return false;
	}
}


else if l_slope != noone
{
	slope_colliding = true;
	var local_slope = ((l_slope.y+16)-l_slope.y)/((l_slope.x+16)-l_slope.x);
	var test_y = (l_slope.x * local_slope) -x + l_slope.y+16;
	if y+1+argument[0] > test_y
	{
		return true;
	}
	else return false;
}

else return false;