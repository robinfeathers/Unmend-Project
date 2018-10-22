/*varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float percent;

void main()
{    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ); 

    if (gl_FragColor.r > percent) gl_FragColor.a = 0.0; 

    gl_FragColor.rgb = vec3(0.0);
}*/

varying vec2 v_vTexcoord_A;
varying vec2 v_vTexcoord_B;
varying vec4 v_vColour;


uniform float percent;
uniform sampler2D alpha_texture;
uniform sampler2D base_texture;
uniform vec4 uv_alpha_texture;

void main()
{  
	//samples
	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord_A );
	float mask_val = texture2D(alpha_texture, v_vTexcoord_B).r;
	if (mask_val > percent)
	{
		mask_val = 0.0;
	}
	else
	{
		mask_val = 1.0;
	}
	
	gl_FragColor = vec4(base_col.rgb, base_col.a * mask_val);
	
	/*
	float mask_val = 1.0;
	if (texture2D(alpha_texture, v_vTexcoord_B).r > percent) mask_val = 0.0;*/
	//else mask_val = 1.0;
		
    
	
	
	//vec2 offset = vec2 (uv_alpha_texture.x - v_vTexcoord.x, uv_alpha_texture.y - v_vTexcoord.y);
   //if (texture2D(alpha_texture, v_vTexcoord_B).r > percent) gl_FragColor.a = 0.0;
}