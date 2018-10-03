///Makes the object shake and gitter
///@Arg max X displacement
///@arg Max Y displacement
var xmax = argument[0];
var xmin = (argument[0] * -1);
var ymax = argument[1];
var ymin = (argument[1] * -1);

draw_sprite_ext(sprite_index, image_index, x + random_range(xmin, xmax), y + random_range(ymin, ymax), image_xscale, image_yscale, 0, c_white, 1);
