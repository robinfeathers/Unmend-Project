owner = noone;

var random_direction = random_range(1,10);
var random_speed = random_range(1,10);

if random_direction > 5 image_xscale = 1;
else image_xscale = -1;

image_speed = .8 + (random_speed * 0.02)