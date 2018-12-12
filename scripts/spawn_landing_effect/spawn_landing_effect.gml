///@arg x_displacement

var inst = instance_create_depth(x + argument[0],y,7,fx_animate_disappear_object)
	with inst
	{
		play_animation(s_fx_landing_dust);
	}
var inst = instance_create_depth(x - argument[0],y,7,fx_animate_disappear_object)
	with inst
	{
		image_xscale = -1;
		play_animation(s_fx_landing_dust);
	}