part_system = part_system_create();

part_emitter = part_emitter_create(part_system);

particle_type = part_type_create();
part_type_sprite(particle_type,s_magicglass,true,true,true);
part_type_size(particle_type,.6,.75,0,0);
part_type_alpha2(particle_type,1,0);
part_type_direction(particle_type, 0,359,0,0)
part_type_life(particle_type,45,60);
part_type_blend(particle_type,true)
part_type_speed(particle_type,1.5,3,-.01,0)


part_emitter_region(part_system, part_emitter, 
x - 16, x + 16, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst(part_system, part_emitter, particle_type, 25)
