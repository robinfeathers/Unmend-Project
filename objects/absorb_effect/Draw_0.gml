if time == -100 {time = time_max}
time -= 1
if time > 0
{
	with o_vernal
	{
		gpu_set_fog(true, other.col, 0, 0)
		var a = other.time / other.time_max
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, a)
		gpu_set_fog(false, 0, 0, 0)
	}
}
else {instance_destroy()}