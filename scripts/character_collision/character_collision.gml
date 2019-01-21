/// @desc collision
/// @arg player?
/// @arg test_blink?
/// @arg test_floor?
/// @arg test_wall?
/// @arg test_ceiling?

//MISSING: CHANGE ALL OF THESE FUCKING Y'S TO NOT USE THE Y COORDINATE BUTTHE BOTTOM OF THE BOCKING BOUND BOX

var slope_block = noone;
var test_y = y;

//RSLOPE
var r_slope = instance_place(x,y + 4,o_t_solid_r_slope);
if r_slope != noone
{
	var slope_block = instance_position(r_slope.bbox_left - 8, r_slope.bbox_top + 8, o_t_solid);
	var local_slope = ((r_slope.bbox_bottom)-r_slope.y)/((r_slope.bbox_right)-r_slope.x);
	var test_y = (bbox_right - ((bbox_right - bbox_left)/2)) - (r_slope.bbox_left * local_slope) + r_slope.bbox_top;
	
	//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
	if test_y < r_slope.y and (place_meeting(x, y + 1, o_t_solid))
	{
		test_y = r_slope.y;
	}
	
	//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
	if (test_y >= r_slope.bbox_bottom) and (place_meeting(x+hsp,y + 8,o_t_solid))
	{		
		test_y = r_slope.bbox_bottom;
	}
	
	//If I'm going beneath the line point, bring me up to it
	if y > test_y and vsp >= 0
	{	
		if argument[2] == true return "rslope";
		else if argument[3] == true{}
		else if argument[4] == true{}
		else
		{
			y = test_y;
			vsp = 0;
		}
	}
	
	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y + abs(hsp) + 8 > test_y and vsp == 0// and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launching_horizontal || launching_down)
		{}
		else
		{
			if argument[2] == true return "rslope";
			else if argument[3] == true{}
			else if argument[4] == true{}
			else
			{
				y = test_y;
			}
		}
	}
}

//LSLOPE
var l_slope = instance_place(x,y + 4,o_t_solid_l_slope);
if l_slope != noone
{
	var slope_block = instance_position(l_slope.bbox_right + 8, l_slope.bbox_top + 8, o_t_solid);
	if slope_block == noone slope_block = instance_position(l_slope.bbox_right + 24, l_slope.bbox_top - 8, o_t_solid);
	var local_slope = ((l_slope.bbox_bottom)-l_slope.y)/((l_slope.bbox_right)-l_slope.x);
	var test_y = (l_slope.bbox_left * local_slope) - (bbox_right - ((bbox_right - bbox_left)/2)) + l_slope.bbox_bottom;
	
	//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
	if test_y < l_slope.y and (place_meeting(x, y + 1, o_t_solid))
	{
		test_y = l_slope.y;
	}
	
	//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
	if (test_y >= l_slope.bbox_bottom) and (place_meeting(x+hsp,y + 8,o_t_solid))
	{			
		test_y = l_slope.bbox_bottom;
	}
	
	//If I'm going beneath the line point, bring me up to it
	if y > test_y and vsp >= 0
	{	
		if argument[2] == true return "lslope";
		else if argument[3] == true{}
		else if argument[4] == true{}
		else
		{
			y = test_y;
			vsp = 0;
		}
	}

	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y + abs(hsp) + 8 > test_y and vsp == 0// and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launching_horizontal || launching_down)
		{}
		else
		{
			if argument[2] == true return "lslope";
			else if argument[3] == true{}
			else if argument[4] == true{}
			else
			{
				y = test_y;
			}
		}
	}
}

//BLOCK COLLISIONS
var collision_testing_hsp = hsp;

//move X
if argument[1] == false and argument[2] == false and argument[3] == false and argument[4] == false
{
	if (r_slope != noone or l_slope != noone) and slope_speed_cap = true
	{
		x += hsp * 0.8 * get_delta_time();
		collision_testing_hsp = hsp *0.8;
	}
	else
	{
		x += hsp * get_delta_time();
	}
}
//snap to wall
if place_meeting(x+sign(hsp),bbox_bottom-1,o_t_solid) and argument[3] == false
{
	var wall = instance_place(x+sign(hsp),bbox_bottom,o_t_solid);
	
	if slope_block != noone
	{
		if instance_position(slope_block.x, slope_block.y-1,o_t_solid)
		{
			slope_block = noone;
		}
	}
	
	if wall != slope_block
	{
		if collision_testing_hsp >= 0
		{
			x = (wall.bbox_left-1) - (bbox_right-x);
		}
		else if collision_testing_hsp <= 0
		{
			x = (wall.bbox_right+1) - (bbox_left-x);
		}
		if argument[1] == true return true;
		else hsp = 0;
	}
}

//test wall collision
if argument[3] and place_meeting(x+sign(image_xscale),bbox_bottom-1,o_t_solid)
{
	var wall = instance_place(x+sign(image_xscale),bbox_bottom,o_t_solid);

	if slope_block != noone
	{
		if instance_position(slope_block.x, slope_block.y-1,o_t_solid)
		{
			slope_block = noone;
		}
	}
	if wall != slope_block
	{
		return "wall";
	}
}
if argument[3] return "none";



//move Y
if argument[1] == false and argument[2] == false and argument[3] == false and argument[4] == false
{
	y += vsp * get_delta_time();
}
//snap to floor/ceiling
if place_meeting(x,y+sign(vsp),o_t_solid)
{
	var plane = instance_place(x,y+sign(vsp),o_t_solid);
	
	if vsp >= 0 and slope_block != plane
	{
		y = (plane.bbox_top - 1) - (bbox_bottom-y);
		if argument[2] == true return "ground";
		vsp = 0;
	}
	else if vsp < 0 and slope_block != plane
	{
		y = (plane.bbox_bottom + 1) - (bbox_top-y);
		vsp = 0;
	}
}


if argument[2] and place_meeting(x,y+1,o_t_solid) return "ground"
if argument[4] and place_meeting(x,y-1,o_t_solid) return "ceiling"
if argument[1] return true;
if argument[2] return "none";
if argument[4] return "none";