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