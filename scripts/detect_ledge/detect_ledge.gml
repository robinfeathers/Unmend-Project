if image_xscale = 1
{
	if !place_meeting(bbox_right,y+1,o_t_solid)
	and !place_meeting(bbox_right,y+walksp * 4,o_t_solid_l_slope)
	and !place_meeting(bbox_right,y+walksp * 4,o_t_solid_r_slope)
	{
		return true;
	}
}
else if image_xscale = -1
{
	if !place_meeting(bbox_left,y+1,o_t_solid)
	and !place_meeting(bbox_left,y+walksp * 4,o_t_solid_l_slope)
	and !place_meeting(bbox_left,y+walksp * 4,o_t_solid_r_slope)
	{
		return true;
	}
}
else return false;