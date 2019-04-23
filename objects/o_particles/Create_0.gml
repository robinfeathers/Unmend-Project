pRain_Sys = part_system_create()
pRain = part_type_create()
pRain_Emit = part_emitter_create(pRain_Sys)

pRainF_Sys = part_system_create()
pRainF = part_type_create()
pRainF_Emit = part_emitter_create(pRainF_Sys)

pHairessence_Sys = part_system_create()
pHairessence = part_type_create()

weather = ""

part_system_depth(pHairessence_Sys, 0)
part_type_shape(pHairessence, pt_shape_flare)
part_type_life(pHairessence, 100, 100)
part_type_color_rgb(pHairessence, 202, 202, 213, 213, 214, 214)
part_type_direction(pHairessence, 70, 110, 0, 0)
part_type_speed(pHairessence, 1, 1, 0, 0)
part_type_size(pHairessence, 0.3, 0.4, -0.005, 0)

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

depth = -1000

thunder = -1
thunderalpha = 0