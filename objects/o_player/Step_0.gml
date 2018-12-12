/// @description Find Player State And Call Appropriate Script
//Check inputs
get_player_input()

if key_restart game_restart();

//if sliding show_debug_message(vsp)
//Help animator figure out which way you wanna look
if (intended_direction == 1) || (intended_direction == -1)
{
	if my_direction != 0
	and common_action_denial(1,1,1,1,1,1,1,1)
	and mystate != player_state.acting
	{
		intended_direction = my_direction;
	}
}

//Make the player dive
if run_dive_script == true
{
	land_buffer = false;
	
	if check_if_ground(3) != true
	{
		vsp += 2;
	}
	
	else if (place_meeting(x,y+2,o_t_solid))
	{
		spawn_landing_effect(1)
		run_dive_script = false;
		attack(s_player_dive_land, 0, 18, 34, 0, 0);
	}
	
	else //if (!place_meeting(x,y+vsp,o_t_solid))
	{
		run_dive_script = false;
		//check if player landed on a slope
		var r_slope = instance_place(x,y+8,o_t_solid_r_slope);
		var l_slope = instance_place(x,y+8,o_t_solid_l_slope);
		
		if r_slope != noone
		{
			var local_slope = ((r_slope.y+16)-r_slope.y)/((r_slope.x+16)-r_slope.x);
			var test_y = x - (r_slope.x * local_slope) + r_slope.y;
			
			//if line point is above top of line and I'm colliding witha wall, cap line point height at top of line
			if test_y < r_slope.y and (place_meeting(x+sign((my_direction) * 2),y + 8,o_t_solid))
			{
				test_y = r_slope.y;
			}
	
			//if line point is below or equal to bottom of line and I'm collidinlg with wall, cap line point at bottom of line
			if (test_y >= r_slope.y + 16) and (place_meeting(x+hsp,y + 8,o_t_solid))
			{		
				test_y = r_slope.y + 16;
			}	

			if y + vsp + 1> test_y 
			{
				y = test_y
				vsp = 0;
				lockout_time = 0;
				lockwalk_time = 0;
				intended_direction = 1
				slide_direction = 1
				slide_decay_time = 0
				slidesp = starting_slidesp;
				sliding = true;
				diving = false;
				airborn = false;
			}
		}
		
		else if l_slope != noone
		{
			var local_slope = ((l_slope.y+16)-l_slope.y)/((l_slope.x+16)-l_slope.x);
			var test_y = (l_slope.x * local_slope) - x + l_slope.y+16;
			
			//if line point is above top of line and I'm colliding with a wall, cap line point height at top of line
			if test_y < l_slope.y and (place_meeting(x,y + 8,o_t_solid))
			{
				test_y = l_slope.y;
			}
	
			//if line point is below or equal to bottom of line and I'm colliding with wall, cap line point at bottom of line
			if (test_y >= l_slope.y + 16) and (place_meeting(x+hsp,y + 8,o_t_solid))
			{			
				test_y = l_slope.y + 16;
			}
			
			if y + vsp + 1> test_y
			{
				y = test_y
				vsp = 0;
				lockout_time = 0;
				lockwalk_time = 0;
				intended_direction = -1
				slide_direction = -1
				slide_decay_time = 0
				slidesp = starting_slidesp;
				sliding = true;
				diving = false;
				airborn = false;
			}	
		}	
	}
}

//Make the player slide
if sliding == true
{
	slide();
}

//Make the player divecut
if dive_cutting
{
	if check_if_ground(3)
	{
		dive_cutting = false;
		play_animation(s_player_divecut_land);
		lockout_time = 40;
		lockwalk_time = 55;
	}
	else
	{
		vsp += max_fallsp / 2;
	}
}

//Apply Gravity to the player
if !check_if_ground(abs(hsp))
and common_action_denial(0,0,0,1,1,1,1,0)
and !dash_ending
and airstep_input_timer == 0
and !air_spin_attacking
{
	apply_gravity(true)
	if jump_buffer > 0
	{
		jump_buffer -= get_delta_time();
	}
}

//Reset jump buffer and wall airstep if on ground
if check_if_ground(3) == true
{
	jump_buffer = jump_buffer_max;
	dash_allowed = true;
	if !air_stepping
	{
		stepped_wall = false;
	}
}

//Buffer jumping before landing
if (place_meeting(x,y+3,o_t_solid))
and !diving
and mystate = player_state.neutral
{
	if key_jump == true
	{
		land_buffer = true;	
	}
}

//check for jump buffer on slopes
var slope_colliding = false;
var r_slope = instance_place(x,y+8,o_t_solid_r_slope);
var l_slope = instance_place(x,y+8,o_t_solid_l_slope);

if r_slope != noone
{
	slope_colliding = true;
	var local_slope = ((r_slope.y+16)-r_slope.y)/((r_slope.x+16)-r_slope.x);
	var test_y = x - (r_slope.x * local_slope) + r_slope.y;
	if y+3 > test_y and key_jump == true
	and !diving
	{

		land_buffer = true;
	}
}
if l_slope != noone
{
	slope_colliding = true;
	var local_slope = ((l_slope.y+16)-l_slope.y)/((l_slope.x+16)-l_slope.x);
	var test_y = (l_slope.x * local_slope) -x + l_slope.y+16;
	if y+3 > test_y and key_jump == true
	and !diving
	{
		land_buffer = true;
	}
}


//Cut player speed a bit when they land
if (check_if_ground(3) == true)
and (airborn == true)
and (vsp == 0)
and !spin_attacking
{
	hsp = hsp * .75;
}

//Grab ledge
var block = instance_place(x +(intended_direction * 4), y-24, o_t_solid);
if block != noone
and (key_up || my_direction != 0)
and vsp >= 0
and check_if_ground(3) == false
and place_meeting(x, y + 16, o_t_solid) == false
and place_meeting(x, y + vsp, o_t_solid) == false
and common_action_denial(1,1,1,1,1,1,1,1)
and block.y > y - 32
and block.y < y - 20
{
	var ledge_viable = false;
	if intended_direction == -1
	and x > block.x + 16
	{
		edge_x = block.x + 16
		edge_y = block.y
		ledge_viable = true;
		var facethisway = -1;
	}
	else if intended_direction == 1
	and x < block.x
	{
		edge_x = block.x
		edge_y = block.y
		ledge_viable = true;
		var facethisway = 1;
	}
	
	var denyblock = instance_place(edge_x + intended_direction, edge_y - 8, o_t_solid)
	if denyblock == noone
	and ledge_viable == true
	{
		var denyblock = instance_place (edge_x + intended_direction, edge_y - 16, o_t_solid)
	}
	
		if denyblock == noone
		and ledge_viable == true
	{
		holding_ledge = true;
		intended_direction = facethisway;
		image_xscale = facethisway;
		play_animation(s_player_ledge_grab);
		vsp = 0;
		hsp = 0;
		x = edge_x;
		y = edge_y;
		dash_allowed = true;
		stepped_wall = false;
	}
}
else
{
	edge_x = 0;
	edge_y = 0;
}

//Actual Airstep functionality
//AIRSTEP STILL NEEDS TO COMMUNICATE WITH THE STEPPED-ON ENEMY!!!
if air_stepping
{
	//Timer until you are kicked off the enemy
	if airstep_input_timer > 0
	{
		airstep_input_timer -= get_delta_time()
		airstep_holding = true;
	}
	else airstep_input_timer = 0
	
	//Determine direction and arc of step
	if airstep_input_timer == 0 and airstep_holding
	{
		if my_direction == 0
		{
			hsp = 0;
			vsp = jumpheight;
			play_animation(s_player_jump);
		}
		if (my_direction == -1 and intended_direction == -1)
		|| (my_direction == 1 and intended_direction == 1)
		{
			if !airstep_with_wall
			{
				hsp = (max_hsp * 1.5) * intended_direction
				vsp = jumpheight * .8;
				play_animation(s_player_slide_jump);
			}
			else
			{
				hsp = 0;
				vsp = jumpheight;
				play_animation(s_player_jump);
			}
		}
		if (my_direction == -1 and intended_direction == 1)
		|| (my_direction == 1 and intended_direction == -1)
		{
			hsp = (max_hsp * 1.5) * (intended_direction * -1)
			vsp = jumpheight * .8;
			play_animation(s_player_slide_jump);
		}
		airstep_holding = false;
		airstep_lock = airstep_lock_max
		mybuffer = buffer_input.none;
	}
	
	//Prevent player input for a few after airstepping
	if airstep_lock > 0 and !airstep_holding
	{
		airstep_lock -= get_delta_time()
	}
	else if airstep_lock <= 0 and !airstep_holding
	{
		airstep_lock = 0;
		airstep_with_wall = false;
		air_stepping = false;
		//Events to run if you stepped on an enemy instead of a wall
		if stepped_enemy != noone
		{
			stepped_enemy.stepped_on = false;
			stepped_enemy.shake = 2;
			stepped_enemy.dmg_response = hurt_properties.launchdown;
			if stepped_enemy.sleeping == false
			{
				stepped_enemy.poisedmg_taken = 2;
				stepped_enemy.got_hit = true;
			}
		}
		stepped_enemy = noone;
	}
}

//INPUT READER

//Get current input direction
my_direction = key_right - key_left;

//input backstep
if (key_dodge || mybuffer = buffer_input.backstep)
and my_direction == 0
and common_action_denial(1,1,1,1,1,1,1,1)
and check_if_ground(3) == true
and mystate == player_state.neutral
and delay_input != stop_attack.backstep
{
	backstep = true;
	delay_input = stop_attack.backstep;
	backstepsp = max_backstepsp;
	attack(s_player_backflip,0,20,30,0,0);
}

//input Dash
if (key_dodge || mybuffer = buffer_input.dash)
and my_direction != 0
and common_action_denial(0,1,1,1,1,1,1,1)
and dash_allowed
and mystate == player_state.neutral
and delay_input != stop_attack.backstep
{
	if sliding || slide_stopping
	{
		slide_stopping = false;
		sliding = false;
		slide_decay_time = 0;
		if max_dashsp < slidesp
		{
			hsp = slidesp * intended_direction
		}
		slidesp = 0;	
	}
	else hsp = max_dashsp * intended_direction;
	dash = true
	delay_input = stop_attack.backstep;
	attack(s_player_dash,0,20,25,0,0)
	dashsp = max_dashsp;
}

if mybuffer == buffer_input.jump and !check_if_ground(3)
{
	mybuffer = buffer_input.none;
}

//input Jump
if key_jump || mybuffer == buffer_input.jump  || (land_buffer and check_if_ground(0))
{
	if (check_if_ground(7) == true)
	{
		if (mystate == player_state.neutral) and !holding_ledge
		{
			mybuffer = buffer_input.none;
			land_buffer = false;
			vsp = jumpheight;
			reset_attack();
		}
		if sliding and !diving
		{
			mybuffer = buffer_input.none;
			land_buffer = false;
			vsp = jumpheight * 0.9;
		}
	}
	if (check_if_ground(7) == false) and !holding_ledge
	{
		if (key_down || mybuffer = buffer_input.dive)
		and common_action_denial(0,0,0,0,1,1,1,1)
		and (mystate == player_state.neutral)
		{
			diving = true;
			dash= false;
			dash_ending = false;
			vsp = sign(vsp) * -0.5;
			hsp = 0;
			mystate = player_state.acting;
			play_animation(s_player_dive_start);
			slidesp = 0;
			sliding = false;
			slide_decay_time = 0;
			hsp /= 2;
			mybuffer = buffer_input.none
		}
		if (jump_buffer > 0)
		and !key_down
		and common_action_denial(0,1,1,1,1,1,1,1)
		and (mystate == player_state.neutral)
		{
				mybuffer = buffer_input.none;
				vsp = jumpheight;
				reset_attack();
		}
		
		if (jump_buffer <= 0)
		and !key_down
		and common_action_denial(0,1,1,0,1,1,1,1)
		and lockwalk_time == 0
		and (mystate == player_state.neutral)
		{
			var block = instance_position(x + (intended_direction * 8), y-10, o_t_solid);
			var enemy = instance_place(x + my_direction + hsp, y, Enemy);

			if
			block != noone
			{
				if intended_direction == 1
				{
					edge_x = block.x
				}
				if intended_direction == -1
				{
					edge_x = block.x + 16
				}
			}
			
			if enemy != noone
			and y-8 < enemy.y
			and y+32 > enemy.y
			and !place_meeting(enemy.x + enemy.enemy_action_x,enemy.y + enemy.enemy_action_y,o_t_solid)
			{ 
				stepped_wall = false;
				makeairstep();
				show_debug_message("ENEMY")
			}		
			else if
			block != noone
			and (key_up || my_direction != 0)
			and y - 10 > block.y
			and y -30 < block.y
			and !stepped_wall
			{
				show_debug_message("WALL")
				if 
				(my_direction == 1 and x <= edge_x) ||
				(my_direction == -1 and x >= edge_x)
				{
					stepped_wall = true;
					makeairstep();
				}
			}
			
			else show_debug_message("WAERW")
		}
	}
	if holding_ledge and sprite_index != s_player_ledge_getup
		{
			mybuffer = buffer_input.none;
			land_buffer = false;
			vsp = jumpheight;
			reset_attack();
			holding_ledge = false;
			x += 12 * (intended_direction * -1);
			y += 32;
		}
}

//input descend
if vsp < -2
and !key_jump_held
and !diving
and !air_stepping
and sprite_index != s_player_air03_alt
{
	vsp = -2;
}

//Other Ledge commands
if holding_ledge and key_down and sprite_index != s_player_ledge_getup
	{
		play_animation(s_player_idle)
		holding_ledge = false;
		x += 12 * (intended_direction * -1);
		y += 32;
	}

if holding_ledge and key_up
{
	play_animation(s_player_ledge_getup);
	invincible = true;
}


//Combat Input reader

//Basic Attacks
if (key_attack == true) || (mybuffer == buffer_input.light_hit)
{
	if mystate == player_state.neutral and !holding_ledge
	{
		if check_if_ground(0)
		{
			//All ground attacks
			if combo_counter == 0
			and !key_up
			and !key_down
			and !sliding
			{
				attack(s_player_ground01, 0.5, 23, 40, 2, 2);
				combo_counter = 1;
			}
			else if combo_counter == 1
			and !key_up
			and !key_down
			{
				attack(s_player_ground02, 0.5, 23, 40, 2, 2);
				combo_counter = 2;
			}
			else if combo_counter == 2
			and !key_up
			and !key_down
			{
				if !stinger
				{
					attack(s_player_ground03, 0.8, 32, 40, 4, 5);
					combo_counter = 3;
					delay_input = stop_attack.none;
				}
				else
				{
					attack(s_player_slideattack, 0.25, 30, 45, 5, 3);
					hsp = (max_hsp * 0.5) * intended_direction;
					slide_decay_time = 0;
					sliding = false;
					slidesp = 0;
					combo_counter = 0;
					stinger = false;
					spin_attacking = true;
				}
			}
			
			if key_up and delay_input != stop_attack.launch
			and !stinger
			and !key_down
			and !sliding
			{
				attack(s_player_launch, 0.5, 28, 70, 3, 2);
				image_index = 0;
				combo_counter = 0;
				delay_input = stop_attack.launch
			}
			if key_down and delay_input != stop_attack.stinger
			and !key_up
			{
				attack(s_player_stinger,0,25,50,3,3);
				image_index = 0;
				combo_counter = 0;
				delay_input = stop_attack.stinger;
				stinger = true;
				if sliding
				{
					slide_decay_time = 0;
					sliding = false;
					slidesp = 0;
				}
			}
			if sliding and !key_up and !key_down
			{
				attack(s_player_slideattack, 0.25, 30, 45, 5, 3);
				hsp = (max_hsp * 0.5) * intended_direction;
				slide_decay_time = 0;
				sliding = false;
				slidesp = 0;
				combo_counter = 0;
				spin_attacking = true;
			}
		}
		if check_if_ground(0) == false
		{
			//All air attacks
			if combo_counter == 0
			and !key_down
			and !sliding
			{
				attack(s_player_air01, 0.25, 23, 40, 2, 2);
				combo_counter = 1;
			}
			else if combo_counter == 1
			and !key_down
			{
				attack(s_player_air02, 0.25, 23, 40, 2, 2);
				combo_counter = 2;
			}
			else if combo_counter == 2
			and !key_up
			and !key_down
			{
				if !stinger
				{
					attack(s_player_air03, 0.25, 32, 40, 4, 5);
					combo_counter = 3;
					delay_input = stop_attack.none;
				}
			else
				{
					attack(s_player_slideattack, 0.25, 30, 45, 5, 3);
					hsp = (max_hsp * 0.5) * intended_direction;
					slide_decay_time = 0;
					sliding = false;
					slidesp = 0;
					combo_counter = 0;
					stinger = false;
					spin_attacking = true;
					spin_attacking = true;
				}
			}
			else if combo_counter == 2
			and key_up
			and !key_down
			
				{
					attack(s_player_air03_alt, 0, 35, 55, 4, 2);
					air_spin_attacking = true;
					combo_counter = 3;
					delay_input = stop_attack.none;
				}
			/*else if key_down
			and !key_up
			and !sliding
			{
				attack(s_player_divecut_spin, 0, 100000, 100000, 4, 4);
				combo_counter = 0;
				vsp = sign(vsp) * -0.5;
				if sliding
				{
					slide_decay_time = 0;
					sliding = false;
					slidesp = 0;
				}
			}*/
			else if sliding
			and !key_down
			{
					attack(s_player_slideattack, 0.25, 30, 45, 5, 3);
					hsp = (max_hsp * 0.5) * intended_direction;
					slide_decay_time = 0;
					sliding = false;
					slidesp = 0;
					combo_counter = 0;
					stinger = false;
					spin_attacking = true;
					stinger = false;
					spin_attacking = true;
			}
		}
	}
}

//Special Attacks
if (key_specialattack == true) || (mybuffer == buffer_input.special_hit)
{
	if mystate == player_state.neutral and !holding_ledge
	{
		if pulse_points >= pulse_points_requirement
		and delay_input != stop_attack.pulse_neutral
		{
			attack(s_player_pulse_neutral, 0, 35, 45, 0, 0);
			combo_counter = 0;
			delay_input = stop_attack.pulse_neutral;
		}
	}
}

//Spell Attacks and Grab
if (key_grab == true) || (mybuffer == buffer_input.grab)
{
	if mystate == player_state.neutral and !holding_ledge
	{
		if mana_points > 0
		and my_direction != 0
		and !key_up
		and !key_down
		and delay_input != stop_attack.spell_fire
		{
			attack(s_player_magic_circle, 0, 35, 45, 2, 2);
			delay_input = stop_attack.spell_fire;
			if combo_counter < 4
			{
				combo_counter += 1;
			}
			else combo_counter = 0;
		}
	}
}


//see if can create damage slash when player is acting
if mystate == player_state.acting
{	
	var index = image_index;
	try_create_slash(index)
}

//make player backstep
if backstep
{
	hsp = backstepsp * -1 * intended_direction;
	if backstepsp > 0
	{
	backstepsp -= (get_delta_time() / 2);
	}
	else backstepsp = 0;
}

//make player dash
if dash
{
	makedash()
}

//make player stinger
if stinger
{
	if lockout_time <= 0 || place_meeting(x+hsp,y,Enemy)
	{
		mybuffer = buffer_input.none;
		attack(s_player_stingerattack,0,25,40,3,3)
		delay_input = stop_attack.stinger;
		stinger = false;
		show_debug_message(hsp)
	}
	else
	{
		hsp = stingersp * intended_direction;
	}

}

//Check for player State updates
if (lockout_time > 0) and (mystate == player_state.acting)
{
	lockout_time -= get_delta_time();
}
if (lockwalk_time > 0)
{
	lockwalk_time -= get_delta_time();
	
}

if (lockout_time <= 0) and (diving != true) and (mystate == player_state.acting)
{
	lockout_time = 0;
	attack_hsp = 0;
	hsp = 0;
	slashcreated = false;
	air_spin_attacking = false;
	backstep = false;
	mystate = player_state.neutral;
}
if lockwalk_time <= 0
{
	reset_attack();
}

//adjust player speed mid attack if they're holding a direction
if attack_hsp != 0 and my_direction != 0
{
	hsp = attack_hsp * my_direction;
}

//Check horizontal position changes
if common_action_denial(1,1,1,0,1,1,1,1)
and !spin_attacking
and lockwalk_time <= 0
{
move_object_horizontally()
}

//Collision Mask Update
if sprite_index == s_player_slide_down
|| sprite_index == s_player_slide_up
{
	mask_index = s_player_slide_down;
}
else if sprite_index == s_player_ledge_grab
|| sprite_index == s_player_ledge_hold
|| sprite_index == s_player_ledge_getup
{
	mask_index = s_player_ledge_hold;
}
else
{
	mask_index = s_player_idle;
}

//collision check
test_collision(true);

if abs(hsp) < 1 slide_stopping = false;

//ANIMATOR

//convert variables to local for usage
var totalspeed = abs(hsp);
var facing = image_xscale;
var move_direction =abs(my_direction);
var turning = false;
var stopping = false;

if move_direction == 0
and (totalspeed > 0)
{
	stopping = true;
}

//Check Player State Neutral
if mystate == player_state.neutral
and common_action_denial(0,0,0,0,0,0,1,1)
{
//check if in rising in air
	if (check_if_ground(3) == false)
	{
	airborn = true;
		if (vsp < 0)
		and (vsp <= fallanim_delay)
		and !sliding
		and sprite_index != s_player_air03_alt
		{
			play_animation(s_player_jump);	
		}
		if (vsp < 0)
		and sliding
		{
			play_animation(s_player_slide_jump);
		}
		
		if (vsp >= fallanim_delay)
		and !sliding
		and sprite_index != s_player_arc
		and sprite_index != s_player_dashstop
		and sprite_index != s_player_fall
		and sprite_index != s_player_air01
		and sprite_index != s_player_air02
		and sprite_index != s_player_air03
		and sprite_index != s_player_air03_alt
		{
			if vsp > 2.5
			{
				play_animation(s_player_fall)
			}
			else play_animation(s_player_arc);
		}
	}

	//Check if landing
	if (check_if_ground(3) == true)
	and (airborn == true)
	and (vsp == 0)
	{
		if (move_direction == 0)
		and ((sprite_index == s_player_jump) || (sprite_index == s_player_fall)
		|| (sprite_index == s_player_arc)
		|| (sprite_index == s_player_air01) || (sprite_index == s_player_air02)
		|| (sprite_index == s_player_air03))
		{
			spawn_landing_effect(1)
			play_animation(s_player_land_stop);
		}
	
		if (move_direction != 0)
		and ((sprite_index == s_player_jump) || (sprite_index == s_player_fall)
		|| (sprite_index == s_player_arc)
		|| (sprite_index == s_player_air01) || (sprite_index == s_player_air02)
		|| (sprite_index == s_player_air03))
		{
			spawn_landing_effect(1)
			play_animation(s_player_land_run);
		}
	}
	//Check if player is on the Idle on the ground but still airborn for some reason
	if (sprite_index == s_player_idle || sprite_index == s_player_dash)
	and (airborn == true)
	and (vsp == 0)
	{
		airborn = false;
	}

	//Detect if player is turning on ground
	if (check_if_ground(3) == true) and (airborn == false)
	{
		if (move_direction != 0)
		and (totalspeed >= 0) and (totalspeed <= walkanim_delay)
		and (my_direction != facing)
		and (lockwalk_time = 0)
		and (((sprite_index == s_player_idle) || (sprite_index == s_player_stop)) || (sprite_index != s_player_turn_run))
		and (sprite_index != s_player_turn_idle)
		{
			play_animation(s_player_turn_idle);
			
			var inst = instance_create_depth(x - (intended_direction*8),y,7,fx_animate_disappear_object)
			with inst
			{
				play_animation(s_fx_landing_dust);
				image_xscale = o_player.intended_direction;
			}
		}
		
		if intended_direction != image_xscale
		and (((sprite_index == s_player_idle) || (sprite_index == s_player_stop)) || (sprite_index != s_player_turn_run))
		and (sprite_index != s_player_turn_idle)
		{
			play_animation(s_player_turn_idle);
			var inst = instance_create_depth(x - (intended_direction*8),y,7,fx_animate_disappear_object)
			with inst
			{
				play_animation(s_fx_landing_dust);
				image_xscale = o_player.intended_direction;
			}
		}	
		
		//Detect if player is turning while running
		if (move_direction != 0)
		and (totalspeed > walkanim_delay)
		and (my_direction != facing)
		and (sprite_index == s_player_run)
		and ((sprite_index != s_player_turn_run) || (sprite_index != s_player_turn_idle))
		{
	
			play_animation(s_player_turn_run);
			var inst = instance_create_depth(x - (intended_direction*8), y, 7,fx_animate_disappear_object)
			with inst
			{
				play_animation(s_fx_landing_dust);
				image_xscale = o_player.intended_direction;
			}
		}

	//Set running animation if on ground
		if (move_direction > 0)
		and (sprite_index != s_player_turn_idle)
		and (sprite_index != s_player_turn_run)
		and (lockwalk_time <= 0)
		{
			play_animation(s_player_run);
		}

	//detect if the player has stopped moving but still has momentum
		if hsp == 0
		{
			stopping = false;
		}

		if (stopping == true || hsp == 0)
		and sprite_index == s_player_dash
		{
			play_animation(s_player_dashstop)
		}

		if (stopping == true)
		and (totalspeed < (max_hsp - walkanim_delay))
		and (sprite_index != s_player_turn_idle)
		and (sprite_index != s_player_turn_run)
		and (sprite_index != s_player_stop)
		and  (sprite_index != s_player_dashstop)
		and (lockwalk_time <= 0)
		{
			play_animation(s_player_stop);	
		}
	
		if (totalspeed == 0)
		and (my_direction == 0)
		and (intended_direction == image_xscale)
		and (sprite_index == s_player_run)
		and (lockwalk_time <= 0)
		
		{
			play_animation(s_player_stop);
		}
		
		if (sprite_index == s_player_run)
		and (hsp == 0)
		and (my_direction == 0)
		{
			play_animation(s_player_stop);
		}
	}

	//Turn Player correct direction
	if (hsp > 0) and (sprite_index != s_player_turn_idle) and (sprite_index != s_player_turn_run)
	{
		image_xscale = 1;
	}
	if (hsp < 0) and (sprite_index != s_player_turn_idle) and (sprite_index != s_player_turn_run)
	{
		image_xscale = -1;
	}
}
