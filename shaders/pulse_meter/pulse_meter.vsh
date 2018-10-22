//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform vec4 baseUVs;
uniform vec4 alphaUVs;

varying vec2 v_vTexcoord_A;
varying vec2 v_vTexcoord_B;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
  
    v_vColour = in_Colour;
    v_vTexcoord_A = in_TextureCoord;
    v_vTexcoord_B = alphaUVs.xy + ( in_TextureCoord - baseUVs.xy ) * alphaUVs.zw / baseUVs.zw;
	
}
