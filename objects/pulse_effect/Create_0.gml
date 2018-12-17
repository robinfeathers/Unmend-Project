radius = 5
radius2 = 0
image_alpha = 0.25

//x = o_vernal.x
//y = o_vernal.y - sprite_get_height(o_vernal.sprite_index) / 2
//depth = 8

var partcount = 16
for (var i = 0; i < partcount; i += 1)
{
	var inst = instance_create_depth(x, y, depth + 1, pulse_particle)
	var dir = (360 / partcount + random_range(-10,10)) * i
	inst.x = x + lengthdir_x(75, dir)
	inst.y = y + lengthdir_y(75, dir)
	inst.target = id
}