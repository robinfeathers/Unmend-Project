sys = part_system_create()
part = part_type_create()
part2 = part_type_create()
emit = part_emitter_create(sys)
emit2 = part_emitter_create(sys)
surf = -1
radius = 60

part_type_color_rgb(part, 20, 20, 0, 0, 20, 25)
part_type_size(part, 0.3, 0.5, 0, 0.1)
part_type_shape(part, pt_shape_disk)
part_type_life(part, 10, 10)
part_type_color_rgb(part2, 50, 50, 0, 0, 50, 55)
part_type_size(part2, 0.2, 0.3, 0, 0)
part_type_shape(part2, pt_shape_disk)
part_type_life(part2, 50, 60)
part_type_speed(part2, 1, 1.5, 0, 0)
part_type_direction(part2, 70, 110, 0, 0)
part_type_alpha2(part2, 1, 0)

part_emitter_stream(sys, emit, part, 4)
part_emitter_stream(sys, emit2, part2, 4)

depth = -200