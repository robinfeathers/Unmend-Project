var w = 1024
var h = 768

if pause && pause_timer < 10 {pause_timer += 1}
if !pause && pause_timer > 0 {pause_timer -= 1}

if stop_time > 0 || pause_timer > 0
{
	stopped = true;
	if !surface_exists(surface)
	{
		surface = surface_create(w,h);
		surface_set_target(surface);
		draw_surface(application_surface,0,0);
		surface_reset_target()
	}
	instance_deactivate_all(1);
	if pause_timer == 0 {stop_time -= get_delta_time();}
}
else if stopped
{
	if surface_exists(surface)
	{
		{
		surface_free(surface);
		}
	}
	stop_time = 0;
	stopped = false;
	instance_activate_all();
}

if surface_exists(surface)
{
	draw_surface(surface,0,0);
	
}

if pause_timer > 0
{
	if keyboard_check_pressed(vk_left) {pause_tab = menu_rotate(pause_tab, sprite_get_number(sPauseButtonsOff) - 1, -1)}
	if keyboard_check_pressed(vk_right) {pause_tab = menu_rotate(pause_tab, sprite_get_number(sPauseButtonsOff) - 1, 1)}
	
	//draw_set_alpha((pause_timer / 10) * 0.9)
	draw_set_alpha(0.9)
	draw_set_color(c_black)
	draw_rectangle(0, 0, global.view_width, global.view_height, 0)
	draw_set_alpha(pause_timer / 10)
	
	draw_set_color(c_white)
	
	var cornersize = sprite_get_height(sPauseCorners)
	var innersize = sprite_get_height(sPauseInners)
	var subcornersize = sprite_get_height(sPauseSubcorners)
	
	draw_sprite(sPauseCorners, 0, 0, 0)
	draw_sprite(sPauseCorners, 1, global.view_width - cornersize, 0)
	draw_sprite(sPauseCorners, 2, global.view_width - cornersize, global.view_height - cornersize)
	draw_sprite(sPauseCorners, 3, 0, global.view_height - cornersize)
	
	draw_sprite(sPauseInners, 0, global.view_width / 2, global.view_height - innersize)
	
	if pause_tab == 0
	{
		draw_sprite(sPauseSubcorners, 0, global.view_width - subcornersize * 2 - 110, 0)
		draw_sprite(sPauseSubcorners, 1, global.view_width - subcornersize, 0)
		draw_sprite(sPauseSubcorners, 2, global.view_width - subcornersize, global.view_height - subcornersize)
		draw_sprite(sPauseSubcorners, 3, global.view_width - subcornersize * 2 - 110, global.view_height - subcornersize)
	}
	if pause_tab == 1
	{
		draw_sprite(sPauseSubcorners, 0, global.view_width - subcornersize * 2 - 110, 0)
	}
	if pause_tab == 2
	{
		draw_sprite(sPauseSubcorners, 1, global.view_width - subcornersize, 0)
	}
	if pause_tab == 3
	{
		draw_sprite(sPauseSubcorners, 2, global.view_width - subcornersize, global.view_height - subcornersize)
	}
	if pause_tab == 4
	{
		draw_sprite(sPauseSubcorners, 3, global.view_width - subcornersize * 2 - 110, global.view_height - subcornersize)
	}
	
	for (var i = 0; i < sprite_get_number(sPauseButtonsOff); i += 1)
	{
		var sprite = sPauseButtonsOff
		if i == pause_tab {sprite = sPauseButtonsOn}
		draw_sprite(sprite, i, global.view_width / 2, 0)
	}
	draw_sprite(sPauseButtonsCorners, 0, global.view_width / 2, 0)
	
	draw_set_alpha(1)
}

var fadespd = 0
if fadetime != 0 {fadespd = 1 / fadetime}
if fading == 1 {fadetimer += fadespd}
if fading == -1 {fadetimer -= fadespd}
fadetimer = clamp(fadetimer, 0, 1)

if fadetimer > 0
{
	draw_set_alpha(fadetimer)
	draw_rectangle_color(0, 0, global.view_width, global.view_height, fadecol, fadecol, fadecol, fadecol, 0)
	draw_set_alpha(1)
}