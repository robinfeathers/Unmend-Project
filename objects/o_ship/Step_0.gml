var newlayer = currentlayer
if rising_timer == -1
{
	if keyboard_check_pressed(ord("W"))
	{
		if currentlayer == 0
		{
			rising = 1
			rising_timer = 80
			o_game.fading = 1
			o_game.fadespd = 0.03
			o_game.fadecol = c_white
		}
	}
	if keyboard_check_pressed(ord("S"))
	{
		if currentlayer == 1
		{
			rising = -1
			rising_timer = 80
			o_game.fading = 1
			o_game.fadespd = 0.03
			o_game.fadecol = c_white
		}
	}
}

if rising_timer >= 0
{
	if rising_timer == 0
	{
		z = 0
		rising_timer = -1
	}
	else
	{
		z -= rising
		rising_timer -= 1
		if rising_timer <= 30 && o_game.fading == 1
		{
			o_game.fading = -1
			newlayer = currentlayer + rising
			z = rising_timer * rising
		}
	}
}
if newlayer != currentlayer
{
	overworld_layer_switch(layerobjs, newlayer)
	currentlayer = newlayer
}

if rising_timer == -1
{
	z += z_shift * 0.05
	if z <= 0 {z_shift = 1}
	if z >= 2 {z_shift = -1}

	var key_left = keyboard_check(vk_left)
	var key_right = keyboard_check(vk_right)
	var key_up = keyboard_check(vk_up)
	var key_down = keyboard_check(vk_down)
	var move_h = key_right - key_left
	var move_v = key_down - key_up

	if move_v == 0
	{
		if move_h == -1 {dir = 0}
		if move_h == 1 {dir = 2}
	}
	if move_h == 0
	{
		if move_v == -1 {dir = 1}
		if move_v == 1 {dir = 3}
	}

	var hsp = 0
	var vsp = 0
	if move_h != 0 || move_v != 0
	{
		var spd = 1
		if dir == 0 {hsp = -spd}
		if dir == 1 {vsp = -spd}
		if dir == 2 {hsp = spd}
		if dir == 3 {vsp = spd}
	}
	
	if place_free(x + hsp, y) && place_free(x, y + vsp)
	{
		x += hsp
		y += vsp
	}
}

image_index = dir