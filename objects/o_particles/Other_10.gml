part_emitter_clear(pRain_Sys, pRain_Emit)
part_emitter_clear(pRainF_Sys, pRainF_Emit)

switch weather
{
	case "rain":
		part_emitter_stream(pRain_Sys, pRain_Emit, pRain, 5)
		part_emitter_stream(pRainF_Sys, pRainF_Emit, pRainF, 2)
		break
}