//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (gl_FragColor.rgb == vec3(0.0, 1.0, 0.0))
	{
		gl_FragColor.rgb = vec3(0.6, 0.6, 0.8);
	}
	else
	{
		gl_FragColor.rgb = vec3(0.0, 0.0, 0.1328);
	}
}
