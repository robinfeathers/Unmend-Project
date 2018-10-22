//Hit Shake timer
if shake > 0
{
	shake -= 0.5;
}
else
{
	shake = 0;
}

//Behaivor when stepped on
if stepped_on
{
	//Reaction to be stepping when stunned
	if my_state == enemy_state.stunned
	{
		hsp = 0;
		vsp = 0;
		bounce = false;
		launchingup = false;
		launchingdown = false;
		launchinghorizontal = false;
	}
	else stepped_on = false;
}

//Calculate poise percentage for graphical effect
if (poise / poise_max <= 1) and (poise / poise_max > .5)
{
	poise_index = s_firesmall;
}

if (poise / poise_max <= .5)
{
	poise_index = s_firelarge;
}

//event done when damage is taken.
if got_hit == true and sleeping != true
{
	//Juggle air gain
	if launchingup || bounce
	{
		vsp = -2.25;
		show_debug_message("JUGGLE AIR")
	}

	//Glow effect when hit
	var inst;
	inst = instance_create_depth(x + enemy_action_x, y + enemy_action_y,"FX_Objects",grow_effect)
	with (inst)
	{
		max_scale = .5;
		growth_rate = .1;
		max_alpha = .4;
		sprite_index = s_glow;
	}
	
	//Cut effect if the enemy was actually hurt and not just poise damage
	if dmg_taken != 0
	{
		show_debug_message("CUT")
	inst = instance_create_depth(x + enemy_action_x, y + enemy_action_y,"FX_Objects",cut_impact)
	}
	
	//graphical effects for when the enemy is not stunned by a hit.
	if my_state != enemy_state.stunned and poisedmg_taken != 0
	{
		if poise > 0
			{
			inst = instance_create_depth(x + enemy_action_x, y + enemy_action_y,"FX_Objects",grow_effect)
			with (inst)
			{
				max_scale = 1;
				growth_rate = .1;
				max_alpha = 1;
				sprite_index = other.poise_index;
				image_speed = 1;
				image_xscale = .5;
				image_yscale = .5;
				image_alpha = 1;
			}
		}
		if poise <= 0
		{
			stop_time = 8;
			instance_create_depth(x, y + enemy_action_y,"Particle_Objects",o_particle_test)
			var inst;
			inst = instance_create_depth(x, y + enemy_action_y,"FX_Objects",grow_effect)
			with (inst)
			{
				max_scale = .75;
				growth_rate = .1;
				max_alpha = .6;
				sprite_index = s_glow;
			}
			
		}
	}
	
	//statistical adjustments
	hp -= dmg_taken;
	dmg_taken = 0;
	poise -= poisedmg_taken;
	poisedmg_taken = 0;
	
	//reset things
	poise_regen_time = poise_regen_time_max;
	got_hit = false;
}

//ignore a hit if the enemy is sleeping
if got_hit == true and sleeping == true
{
	got_hit = false;
	dmg_taken = 0;
	poisedmg_taken = 0;
}

//Start waking up if sleeping and then reset the enemy.
if sleeping
{
	dmg_response = hurt_properties.normal;
	if sleepduration > 0
	{
		sleepduration -= get_delta_time()
	}
	if sleepduration <= 0
	{
		play_animation(wake_sprite);
	}
}


//If poise is less than max, start timer, if timer is done, start regening poise
if (poise != poise_max)
and my_state != enemy_state.stunned
{
	
	if poise_regen_time <= 0
	{
		poise += poise_regen_rate * get_delta_time()
	}
	if poise_regen_time > 0
	{
		poise_regen_time -= get_delta_time();
	}
}


//If stun timer is run out, refresh it and unstun the enemy
if stunduration <= 0
{	
	poise = poise_max;
	stunduration = max_stunduration;
	play_animation(idle_sprite);
	my_state = enemy_state.neutral;
}
if (poise >= poise_max)
{
	poise = poise_max;
}

//keep enemy stunned if they have no poise
if poise <= 0 
{
	if my_state != enemy_state.stunned
	{
	hsp = 0;
	vsp = 0;	
	}
	my_state = enemy_state.stunned;
	if !launchingup
	and !launchingdown
	and !launchinghorizontal
	and !bounce
	and !sleeping
	and !stepped_on
	{
		stunduration -= get_delta_time()
		play_animation(stunned_sprite);
	}
}


//Enable launches if the last hit had the properties.
if my_state == enemy_state.stunned
{
	if dmg_response == hurt_properties.launchup
	{
		bounce = false;
		launchinghorizontal = false;
		launchingup = true;
		launchingdown = false;
		hsp = 0;
		vsp = launchup_sp
		show_debug_message("INITIAL LAUNCH")
		play_animation(launch_up_h_sprite);
		var inst;
		inst = instance_create_depth(x, y,"FX_Objects",launch_gust)
		with inst
		{
		}
	}
	else if dmg_response == hurt_properties.launchdown
	{
		bounce = false;
		launchinghorizontal = false;
		launchingup = false;
		launchingdown = true;
		hsp = 0;
		vsp = launchup_sp
		play_animation(launch_down_sprite);
		var inst;
		inst = instance_create_depth(x,bbox_top + 12,"FX_Objects",launch_gust)
		with inst
		{
			image_angle = 180
		}
	}
	else if dmg_response == hurt_properties.launchhorizontal
	{
		bounce = false;
		launchinghorizontal = true;
		launchingup = false;
		launchingdown = false;
		vsp = -4;
		hsp = launchup_sp * hit_direction *-1;
		y -= 2;
		play_animation(launch_up_h_sprite);
		var launchdirection = 0;
		if hit_direction == -1 launchdirection = bbox_left + 8;
		else launchdirection = bbox_right - 8;
		var inst;
		inst = instance_create_depth(launchdirection,y + enemy_action_y,"FX_Objects",launch_gust)
		with inst
		{
			image_angle = 90
			image_yscale = other.hit_direction * -1;
		}
	}
	else if dmg_response == hurt_properties.hitbounce
	{
		bounce = true;
		vsp = bounce_sp;
		play_animation(bounce_floor_sprite);
	}
}
dmg_response = hurt_properties.normal;

//Stop vertical launches if enemy has hit the ground
if (launchingup || launchingdown || launchinghorizontal) and check_if_ground(0) and vsp >= 0
{
	if launchingdown
	{
		//Emit Stun Damage
		var inst;
		inst = instance_create_depth(x + enemy_action_x, y + enemy_action_y,"FX_Objects",hitslash)
		with (inst)
		{
			sprite_index = s_fx_launch_impact;
			attack_properties = hit_properties.bounce
			creator = other.id;
			poisedmg = 8;
			mask_index = sprite_index;
		}
	}
	
	launchingup = false;
	launchingdown = false;
	launchinghorizontal = false;
	bounce = true;
	hsp = 0;
	vsp = bounce_sp;
	show_debug_message("BOUNCE")
	//PUT ANY BOUNCE FX HERE
	play_animation(bounce_floor_sprite);
}

//Stop horizontal launces if enemy has hit a wall
var r_slope = instance_place(x,y+max_fallsp,o_t_solid_r_slope);
var l_slope = instance_place(x,y+max_fallsp,o_t_solid_l_slope);

if launchinghorizontal and place_meeting(x+hsp,y,o_t_solid) and r_slope == noone and l_slope == noone
{
	while (!place_meeting(x+sign(hsp),y,o_t_solid))
	{
		x += sign(hsp);
	}
	launchinghorizontal = false;
	bounce = true;
	hsp = -.5 * hit_direction;
	vsp = bounce_sp;
	
	//Emit Stun Damage
	var inst;
	inst = instance_create_depth(x + enemy_action_x, y + enemy_action_y,"FX_Objects",hitslash)
	with (inst)
	{
		sprite_index = s_fx_launch_impact;
		attack_properties = hit_properties.bounce
		creator = other.id;
		poisedmg = 8;
		mask_index = sprite_index;
	}
	
	//PUT ANY BOUNCE FX HERE
	play_animation(bounce_wall_sprite)
	
}

//Stop Bounce if enemy has hit the ground
if bounce and check_if_ground(0) and vsp >= 0
{
	bounce = false;
	sleeping = true;
	sleepduration = max_sleepduration;
	vsp = 0;
	hsp = 0;
	//PUT ANY BOUNCE FX HERE
	play_animation(sleep_sprite);
}

//Launch Enemy if proper stuff is set up
if launchingup and my_state == enemy_state.stunned
{
	show_debug_message("THE LAUNCH RUNNING CODE")
	launch_me_up();
}
else launchingup = false;
if launchingdown and my_state == enemy_state.stunned
{
	launch_me_down();
}
else launchingdown = false;
if launchinghorizontal and my_state == enemy_state.stunned
{
	launch_me_horizontal();
}
else launchinghorizontal = false;

//Bounce enemy post launch
if bounce
{
	bounce_me();
}

//Behavior patterns 
if my_state == enemy_state.neutral
{
	//WANDER AI
	if ai_wander
	{	
		//establish initial direction
		if !stopping and !walking
		{
			walking = true;
			wander_direction = sign(random_range(-10,10))
			while wander_direction = 0
			{
				wander_direction = sign(random_range(-10,10))
			}
			wander_destination = (irandom_range(wander_range_min, wander_range_max) * wander_direction) + x;
			play_animation(walk_sprite);
			image_xscale = wander_direction;
		}
		
		//make them walk
		if walking and !stopping
		{
			if (x >= wander_destination and wander_direction == 1) or
			(x <= wander_destination and wander_direction == -1) or
			place_meeting(x+hsp,y+vsp,Enemy) or
			detect_ledge()
			//NEED TO UPDATE FOR WALL COLLISION WHEN COLLISION CODE GET REWRITTEN
			{
				stopping = true;
				walking = false;
				hsp = 0;
				play_animation(idle_sprite);
				ai_pause_time = random_range(50,200);
			}
			else hsp = walksp * wander_direction
		}
		
		//make them pause
		if !walking and stopping
		{
			//Run down timer
			if ai_pause_time > 0
			{
				ai_pause_time -= get_delta_time()
			}
			//pick new destination and walk there.
			if ai_pause_time <= 0
			{
				ai_pause_time = 0;
				walking = true;
				stopping = false;
				wander_direction *= -1;
				wander_destination = (irandom_range(wander_range_min, wander_range_max) * wander_direction) + home_x;
				play_animation(walk_sprite);
				image_xscale = wander_direction;
			}
		}
	}
}



on_l_slope = false;
on_r_slope = false;

unit_collision();
//Apply physics
test_collision(false)

