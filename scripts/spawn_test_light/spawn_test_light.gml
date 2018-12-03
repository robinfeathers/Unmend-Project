/// @desc spawn_test_light
// @arg x
// @arg y
// @arg scale

var inst = instance_create_depth(argument[0], argument[1],"FX_Objects",grow_effect)
with (inst)
{
	max_scale = argument[2];
	growth_rate = .1;
	max_alpha = 1;
	sprite_index = s_glow;
}