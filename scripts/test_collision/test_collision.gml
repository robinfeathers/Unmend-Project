///@arg is_player?

var slope_colliding = false;
var test_y = y;
var slope_y = y;
//RSLOPE
var r_slope = instance_place(x,y+max_fallsp,o_t_solid_r_slope);
if r_slope != noone
{
	slope_colliding = true;
	var local_slope = ((r_slope.y+16)-r_slope.y)/((r_slope.x+16)-r_slope.x);
	var test_y = x - (r_slope.x * local_slope) + r_slope.y;
	
	//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
	if test_y < r_slope.y and (place_meeting(x,y + 8,o_t_solid))
	{
		test_y = r_slope.y;
	}
	
	//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
	if (test_y >= r_slope.y + 16) and (place_meeting(x+hsp,y + 8,o_t_solid))
	{		
		test_y = r_slope.y + 16;
	}
	
	//If I'm going beneath the line point, bring me up to it
	if y + vsp > test_y 
	{	
		y = test_y;
		on_r_slope = true;
		vsp = 0;
	}
	
	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y < test_y and vsp == 0 and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launchinghorizontal || launchingdown)
		{}
		else
		{
			y = test_y;
		}
		on_r_slope = true;
	}
	
	//set variable for future use
	slope_y = r_slope.y;
}

//LSLOPE
var l_slope = instance_place(x,y+max_fallsp,o_t_solid_l_slope);
if l_slope != noone
{
	slope_colliding = true;
	var local_slope = ((l_slope.y+16)-l_slope.y)/((l_slope.x+16)-l_slope.x);
	var test_y = (l_slope.x * local_slope) - x + l_slope.y+16;
	
	//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
	if test_y < l_slope.y and (place_meeting(x,y + 8,o_t_solid))
	{
		test_y = l_slope.y;
		//show_debug_message("Hi 1")
	}
	
	//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
	if (test_y >= l_slope.y + 16) and (place_meeting(x+hsp,y + 8,o_t_solid))
	{			
		test_y = l_slope.y + 16;
		//show_debug_message("Hi 2")
	}
	
	//If I'm going beneath the line point, bring me up to it
	if y + vsp > test_y 
	{	
		y = test_y;
		on_l_slope = true;
		vsp = 0;
	}

	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y < test_y and vsp == 0 and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launchinghorizontal || launchingdown)
		{}
		else
		{
			y = test_y;
		}
		on_l_slope = true;
	}
	//set variable for future use
	slope_y = l_slope.y;
}

//collide with wall
if (place_meeting(x+hsp,y,o_t_solid)) and (slope_colliding == false)
{
	while (!place_meeting(x+sign(hsp),y,o_t_solid))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

//Move horizontal
if (r_slope == noone) and (l_slope == noone)
{
	x += hsp;
}

else if ((r_slope != noone) || (l_slope != noone)) || (!place_meeting(x,y+1,o_t_solid))
{
	
	if argument[0] == true
	{
		if backstep || stinger || dash || spin_attacking || slide_stopping
		|| mystate == player_state.acting
		{
			x += hsp * .8;
		}
		
		else if sliding
		{
			x += hsp;
		}
		
		else
		{
			if abs(hsp) >= max_slopesp
			{
				hsp = (max_slopesp * intended_direction)
			}
			x += hsp;
		}
	}
	else if argument[0] == false and abs(hsp) >= max_slopesp
		{
			hsp = (max_slopesp * sign(hsp))
			x += hsp;
		}
	else
	{
		x += hsp;
	}
}


//collide with floor/ceiling
if (place_meeting(x,y+vsp,o_t_solid))
{
	while !place_meeting(x,y+sign(vsp),o_t_solid)
	{
		if vsp != 0
		{
			y += sign(vsp);
		}
		else y -= 1;
	}
	if r_slope == noone and l_slope == noone
	{
		while place_meeting(x,y,o_t_solid)
		{
			y -= 1;
		}
	}
	vsp = 0
}

if check_if_ground(3) == true
{
	if r_slope != noone || l_slope != noone
	{
		//while colliding solid & slope line point is below than the top of the line or slope point is high up than me
		while (place_meeting(x,y,o_t_solid)) and ((test_y >= slope_y+16) || (test_y < y))
		{
			y -= 1;			
		}
		
		while (place_meeting(x,y,o_t_solid)) and ((test_y <= slope_y) || (test_y < y))
		{
			y -= 1;

		}

	}
}

//Move vertical
if argument[0] == true
{
	y += vsp;
	/*if mystate == player_state.neutral
	{
	y += vsp;
	}

	if mystate == player_state.acting
	{
	y += (vsp);
	}

	if mystate == player_state.dead
	{
	y += vsp;
	}*/
}
else
{
	y += vsp;
}
