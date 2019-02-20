x = o_camera.view_x / 2
var scale = 3
var sep = 200
var offset = 150
var xpos = -x + offset
var fading = false
var threshold = scale * sprite_get_width(s_parallax)
while xpos < room_width
{
	var ypos = 0
	if o_vernal.x > xpos - threshold / 2 && o_vernal.x < xpos + threshold / 2 {fading = true}
	while ypos < room_height
	{
		draw_sprite_ext(s_parallax, 0, xpos, ypos, scale, scale, 0, -1, alpha)
		ypos += scale * sprite_get_height(s_parallax)
	}
	xpos += scale * (sprite_get_width(s_parallax) + sep)
}

if fading {alpha -= 0.1}
else {alpha += 0.1}
alpha = clamp(alpha, 0.4, 1)