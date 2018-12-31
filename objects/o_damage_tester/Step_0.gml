/// @description Insert description here
// You can write your code in this editor
event_inherited();

if test_attack_time <= 0
{
	test_attack_time = test_attack_time_max;
	character_action_set(s_e_yknight_maincombo,0,0,80,80,true,false,false);
	character_slash_set(s_player_ground01_fx,2,create_slash_p.l_up,true,3,2000,0,0,false,0,false);
}
else test_attack_time -= get_delta_time();

