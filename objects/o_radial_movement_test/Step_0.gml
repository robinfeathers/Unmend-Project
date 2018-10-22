origin_x = o_player.x
origin_y = o_player.y - 16

x = origin_x + (cos(angle) * radius);
y = origin_y + (sin(angle) * radius);

angle += rotation_speed;