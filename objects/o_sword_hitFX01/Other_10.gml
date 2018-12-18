part_type_shape(particle_type,pt_shape_flare)
part_type_size(particle_type,0.2,0.35,-0.02,0);
part_type_color_hsv(particle_type,183,108,16,10,82,99)
part_type_alpha2(particle_type,1,.75);
part_type_direction(particle_type, hit_angle-20, hit_angle+20, 0, 0)
part_type_blend(particle_type,true)
part_type_speed(particle_type,2,2.5,-.05,0)

part_emitter_region(part_system, part_emitter, 
x - 16, x + 16, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(part_system, part_emitter, particle_type, 15)