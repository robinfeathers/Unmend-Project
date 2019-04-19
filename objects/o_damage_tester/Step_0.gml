
event_inherited();

if test_attack_time <= 0 and check_if_ground(1) and my_entity_state == entity_state.neutral
{
	test_attack_time = test_attack_time_max;
	character_action_set(s_e_yknight_maincombo,0,0,80,80,true,false,false);
	character_slash_set(hit_fx,3,create_slash_p.l_up,true,1000,2000,0,0,false,0,false,damage_type);
}
else test_attack_time -= get_delta_time();

