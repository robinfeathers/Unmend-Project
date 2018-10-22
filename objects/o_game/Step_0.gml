if keyboard_check_released(ord("Q"))
{
	paused = !paused;
}
var w = 1024
var h = 768
if stop_time > 0
{
	if !surface_exists(surface)
	{
		surface = surface_create(w,h);
		surface_set_target(surface);
		draw_surface(application_surface,0,0);
		surface_reset_target()
	}
	instance_deactivate_all(1);
	stop_time -= get_delta_time();
}
else
{
	if surface_exists(surface)
	{
		{
		surface_free(surface);
		}
	}
	stop_time = 0;
	instance_activate_all();
}
