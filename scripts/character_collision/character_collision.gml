/// @desc collision
/// @arg player?

//MISSING: CHANGE ALL OF THESE FUCKING Y'S TO NOT USE THE Y COORDINATE BUTTHE BOTTOM OF THE BOCKING BOUND BOX

var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);


var slope_block = noone;
var test_y = y;
var slope_y = y;
//RSLOPE
var r_slope = instance_place(x,y + max_fallsp,o_t_solid_r_slope);
if r_slope != noone
{
	var slope_block = instance_position(r_slope.bbox_left - 8, r_slope.bbox_top + 8, o_t_solid);
	//instance_destroy(slope_block); slope_block = noone;
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
		y = test_y;
		on_r_slope = true;
		vsp = 0;
	}
	
	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y + abs(hsp) + 8 > test_y and vsp == 0// and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launching_horizontal || launching_down)
		{}
		else
		{
			y = test_y;
		}
		//on_r_slope = true;
	}
	
	//set variable for future use
	slope_y = r_slope.y;
	
	//spawn_test_light(x,test_y,0.25)
}

//LSLOPE
var l_slope = instance_place(x,y + max_fallsp,o_t_solid_l_slope);
if l_slope != noone
{
	var slope_block = instance_position(l_slope.bbox_right + 8, l_slope.bbox_top + 8, o_t_solid);
	//instance_destroy(slope_block); slope_block = noone;
	var local_slope = ((l_slope.bbox_bottom)-l_slope.y)/((l_slope.bbox_right)-l_slope.x);
	var test_y = (l_slope.bbox_left * local_slope) - (bbox_right - ((bbox_right - bbox_left)/2)) + l_slope.bbox_bottom;
	
	//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
	if test_y < l_slope.y and (place_meeting(x, y + 1, o_t_solid))
	{
		test_y = l_slope.y;
		//show_debug_message("Hi 1")
	}
	
	//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
	if (test_y >= l_slope.bbox_bottom) and (place_meeting(x+hsp,y + 8,o_t_solid))
	{			
		test_y = l_slope.bbox_bottom;
		//show_debug_message("Hi 2")
	}
	
	//If I'm going beneath the line point, bring me up to it
	if y > test_y and vsp >= 0
	{	
		y = test_y;
		on_l_slope = true;
		vsp = 0;
	}

	//if I'm above the line point and not moving vertically, bring me down to the line
	else if y + abs(hsp) + 8 > test_y and vsp == 0// and !dash and !dash_ending
	{
		if argument[0] = false and (bounce || launching_horizontal || launching_down)
		{}
		else
		{
			y = test_y;
		}
		//on_l_slope = true;
	}
	
	//set variable for future use
	slope_y = l_slope.y;
	
	//spawn_test_light(x,test_y,0.25)
}

//BLOCK COLLISIONS

var collision_testing_hsp = hsp;

//collide with side
if (r_slope != noone or l_slope != noone) and slope_speed_cap = true
{
	x += hsp * 0.8 * get_delta_time();
	collision_testing_hsp = hsp *0.8;
	
}
else
{
	x += hsp * get_delta_time();
}

//snap
if place_meeting(x+sign(hsp),bbox_bottom-1,o_t_solid)
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
			x = (wall.bbox_left-1) - (bbox_right-x);//sprite_bbox_right;
		}
		else if collision_testing_hsp <= 0
		{
			x = (wall.bbox_right+1) - (bbox_left-x);//sprite_bbox_left;
			show_debug_message(y)
		}
		hsp = 0;
	}
}


y += vsp * get_delta_time();
//snap
if place_meeting(x,y+sign(vsp),o_t_solid)
{
	var plane = instance_place(x,y+sign(vsp),o_t_solid);
	
	
	if vsp >= 0 and slope_block != plane
	{
		y = (plane.bbox_top - 1) - (bbox_bottom-y);//sprite_bbox_bottom;
	}
	else if vsp < 0
	{
		y = (plane.bbox_bottom + 1) - (bbox_top-y);//sprite_bbox_top;
	}
	vsp = 0;
}

/*var collide_object = instance_place(x+hsp,y,o_t_solid)

if collide_object != noone// and slope_colliding == false //CHANGETHISLATER
{
	var character_center_length = (bbox_right-bbox_left)/2;
	var character_center_x = bbox_right - ((bbox_right-bbox_left)/2)
	var collide_object_center_x = collide_object.bbox_right -((collide_object.bbox_right-collide_object.bbox_left)/2);
	
	if (bbox_bottom >= collide_object.bbox_top or bbox_top <= collide_object.bbox_bottom)
	{
		
	}
	else
	{
		if character_center_x < collide_object_center_x
		{
			x = collide_object.bbox_left + (x - bbox_right);
			hsp = 0;
			
		}
		else if character_center_x > collide_object_center_x
		{
			x = collide_object.bbox_right + (x - bbox_left);
			hsp = 0;
		}
		
	}
}
x += hsp;

//collide with top and bottom
var collide_object = instance_place(x,y+vsp,o_t_solid)

if collide_object != noone// and slope_colliding == false //CHANGETHISLATER
{
	var character_center_height = (bbox_bottom-bbox_top)/2;
	var character_center_y = bbox_bottom - ((bbox_bottom-bbox_top)/2)
	var collide_object_center_y = collide_object.bbox_bottom -((collide_object.bbox_bottom-collide_object.bbox_top)/2);
	
	
	if (bbox_left > collide_object.bbox_right or bbox_right < collide_object.bbox_left)
	{}
	else
	{
		if character_center_y < collide_object_center_y
		{
			y = collide_object.bbox_top + (y - bbox_bottom);
			vsp = 0;
		}
		else if character_center_y < collide_object_center_y
		{
			y = collide_object.bbox_bottom + (y - bbox_top);
			vsp = 0;
		}
	}
}
y += vsp;
*/

/*
//DEBUG
var character_center_y = bbox_bottom - ((bbox_bottom-bbox_top)/2)
var inst;
inst = instance_create_depth(x, character_center_y,"FX_Objects",grow_effect)
with (inst)
{
	max_scale = .5;
	growth_rate = .1;
	max_alpha = 1;
	sprite_index = s_glow;
}


