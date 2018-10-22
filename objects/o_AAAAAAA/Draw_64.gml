//transition
if (transition_time < transition_length) transition_time += 1/room_speed;

shader_set(screen_transition);

shader_set_uniform_f(uni_time, transition_time/transition_length);

draw_sprite(s_spiral_gradient, 0, 240, 135);

shader_reset();