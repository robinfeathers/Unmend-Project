/// @description Insert description here
// You can write your code in this editor
enum slash_faction
{
	none,
	player,
	enemy,
	ally,
}
slash_alliance = slash_faction.none

creator = noone;
follow_creator = false;
continuous_action = false;

image_speed = 1;
image_xscale = 5;

dmg = 0;
poise_dmg = 0;
starting_frame = 0;
hit_count = 0;
hit_delay = 0;
base_hit_delay = 0;
hsp = 0;
vsp = 0;
damage_angle = 0;
damage_type = "none" //none, physical, magical, true

enum cc_properties
{
	none,
	l_up,
	l_down,
	l_side,
	bounce,
}
crowd_control_property = cc_properties.none;

character_listindex = 1;
character_array[0] = id;

barrier_listindex = 1;
barrier_array[0] = id;