part_type_shape(particle_type,pt_shape_ring)
part_type_size(particle_type,0.3,0.2,-0.02,0);
part_type_color_hsv(particle_type,134,140,140,150,140,150)
part_type_alpha2(particle_type,1,.5);
part_type_direction(particle_type, 0, 355, 0, 0)
part_type_blend(particle_type,true)
part_type_speed(particle_type,2.25,2.75,-.05,0)

part_emitter_region(part_system, part_emitter, 
x - 16, x + 16, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(part_system, part_emitter, particle_type, part_amount)