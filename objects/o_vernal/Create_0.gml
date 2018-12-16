event_inherited();
character_child_alwaysrun();

shadow_width = 24

var hpbar = instance_create_depth(x,y,19,o_health_bar);
with hpbar
{
	owner = other;
}