#version 120

/*
    Aetheris Shader
    First Color Pipeline
*/

uniform sampler2D colortex0;

varying vec2 texcoord;


void main()
{
    // Get original Minecraft image
    vec3 color = texture2D(colortex0, texcoord).rgb;


    // Aetheris signature tone
    // Slightly cooler cinematic color
    color *= vec3(1.02, 1.03, 1.06);


    gl_FragData[0] = vec4(color, 1.0);
}