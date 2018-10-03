var block = instance_position(x + (intended_direction * 8), y-10, o_t_solid);
var enemy = instance_place(x + my_direction + hsp, y, Enemy);
var noenemy = false;

if enemy != noone
{
	noenemy = false;
	play_animation(s_player_airstep_enemy);
	y = enemy.y + enemy.enemy_action_y;
	x = enemy.x + enemy.enemy_action_x;
	stepped_enemy = enemy;
	enemy.stepped_on = true;
	spawn_landing_effect(1)
}
else if block != noone
{
	if my_direction == -1
	and x > block.x + 16
	{
		edge_x = (block.x + 16) + 7	;	
	}
	else if my_direction == 1
	and x < block.x
	{
		edge_x = block.x - 7;
	}
	noenemy = true;
	play_animation(s_player_airstep_wall);
	airstep_with_wall = true;
}

dash_allowed = true;
air_stepping = true;
airstep_input_timer = airstep_input_timer_max;
hsp = 0;
vsp = 0;
slidesp = 0
sliding = false;
reset_attack()
if noenemy x = edge_x;

