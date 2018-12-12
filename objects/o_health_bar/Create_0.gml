//shader
uni_percent = shader_get_uniform(pulse_meter, "percent");
uni_base_texture = shader_get_sampler_index(pulse_meter, "base_texture");
uni_alpha_texture = shader_get_sampler_index(pulse_meter, "alpha_texture");
base_t = sprite_get_texture(pulse_meter_ring,0);
alpha_t= sprite_get_texture(s_spiral_gradient,0);
owner = noone;