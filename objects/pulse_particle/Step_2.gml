image_alpha += 0.05

var dir = 0
if instance_exists(target)
{
	dir = point_direction(x, y, target.x, target.y)
	image_angle = dir
	motion_set(dir, 3)
	if abs (x - target.x) < 5 && abs(y - target.y) < 5 {instance_destroy()}
}
else {instance_destroy()}