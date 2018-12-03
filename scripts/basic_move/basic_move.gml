/// @desc arrowmovement
/// @arg speed

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
hsp = (key_right - key_left) * argument[0];
vsp = (key_down - key_up) * argument[0];