pRain_Sys = part_system_create()
pRain = part_type_create()
pRain_Emit = part_emitter_create(pRain_Sys)

pRainF_Sys = part_system_create()
pRainF = part_type_create()
pRainF_Emit = part_emitter_create(pRainF_Sys)

part_system_depth(pRain_Sys, 1000)
part_type_shape(pRain, pt_shape_pixel)
part_type_life(pRain, 200, 200)
part_type_color_rgb(pRain, 230, 230, 230, 230, 230, 255)
part_type_orientation(pRain, 300, 300, 0, 0, 0)
part_type_scale(pRain, 30, 0.5)

part_type_size(pRain, 1, 1.5, 0, 0)
part_type_direction(pRain, 300, 300, 0, 0)
part_type_speed(pRain, 30, 40, 0, 0)
part_type_alpha1(pRain, 0.5)

part_emitter_stream(pRain_Sys, pRain_Emit, pRain, 5)

// Front
part_system_depth(pRainF_Sys, -1000)
part_type_shape(pRainF, pt_shape_pixel)
part_type_life(pRainF, 200, 200)
part_type_color_rgb(pRainF, 230, 230, 230, 230, 230, 255)
part_type_orientation(pRainF, 300, 300, 0, 0, 0)
part_type_scale(pRainF, 30, 0.5)

part_type_size(pRainF, 1, 1.5, 0, 0)
part_type_direction(pRainF, 300, 300, 0, 0)
part_type_speed(pRainF, 30, 40, 0, 0)

part_emitter_stream(pRainF_Sys, pRainF_Emit, pRainF, 2)
depth = -1000

thunder = -1
thunderalpha = 0