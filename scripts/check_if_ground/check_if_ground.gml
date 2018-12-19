//@arg how far to check below slopes

var slope_colliding = false;
var r_slope = instance_place(x,bbox_bottom+8,o_t_solid_r_slope);
var l_slope = instance_place(x,bbox_bottom+8,o_t_solid_l_slope);

if (place_meeting(x,bbox_bottom+2,o_t_solid))
{
	return true;
}

else if r_slope != noone
{
	slope_colliding = true;
	var local_slope = ((r_slope.bbox_bottom)-r_slope.bbox_top)/((r_slope.bbox_bottom)-r_slope.bbox_top);
	var test_y = x - (r_slope.x * local_slope) + r_slope.bbox_top;
	if bbox_bottom+1+argument[0] > test_y
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
	var local_slope = ((l_slope.bbox_bottom)-l_slope.bbox_top)/((l_slope.bbox_bottom)-l_slope.bbox_top);
	var test_y = (l_slope.x * local_slope) -x + l_slope.bbox_bottom;
	if bbox_bottom+1+argument[0] > test_y
	{
		return true;
	}
	else return false;
}

else return false;