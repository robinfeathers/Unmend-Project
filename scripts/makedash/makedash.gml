//disallow dashing when in the air
if check_if_ground(1) == false
{
	dash_allowed = false;
}
else
{
	dash_allowed = true;
	var inst = instance_create_depth(x - (intended_direction*8),y,8,fx_animate_disappear_object)
			with inst
			{
				play_animation(s_fx_landing_dust);
				image_xscale = o_player.intended_direction;
			}
}

//set speed over time
hsp = dashsp * intended_direction;
if dashsp > 2
{
	dashsp -= (get_delta_time() / 3);
	vsp = 0;
}
if dashsp > 0 and dashsp < 3
{
	play_animation(s_player_dashstop);
	dash_ending = true;
	dashsp -= (get_delta_time() / 4);
	vsp = 0;
}
if dashsp <= 0
{
	dash_ending = false;
	dash = false;
	hsp = 0;
	if !check_if_ground(0)
	{
		vsp = .01
	}
	
}
//handle jump buffer so you can't jump in air afterwords
if jump_buffer > 0
{
	jump_buffer -= get_delta_time();
}