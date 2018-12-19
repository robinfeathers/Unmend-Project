event_inherited();
character_child_alwaysrun();

shadow_width = 24

var hpbar = instance_create_depth(x,y,19,o_health_bar);
with hpbar
{
	owner = other;
}

enum non_repeatable_actions
{
	none,
	s_player_launch_fx,
}
repeat_action = non_repeatable_actions.none;