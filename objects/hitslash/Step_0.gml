if creator == noone
{
	x += o_player.hsp;
	y = o_player.y;
}

if sprite_index == s_player_divecut_fall_fx
and o_player.dive_cutting == false
{
	instance_destroy()
}

if sprite_index == s_firespell_main
{
	x = origin_x + (cos(angle) * radius);
	y = origin_y + (sin(angle) * radius);

	angle += rotation_speed;
	
	if abs(radius) < abs(intended_radius)
	{
		radius += sign(intended_radius) * rotation_speed * 6;
	}
	else radius = intended_radius;

	if abs(angle) > 12 instance_destroy();
}