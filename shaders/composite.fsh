#version 120

/*
    Aetheris Shader
    Composite Pipeline
*/


uniform sampler2D colortex0;

varying vec2 texcoord;


void main()
{

    vec3 color =
    texture2D(
        colortex0,
        texcoord
    ).rgb;


    gl_FragData[0]
    =
    vec4(color,1.0);

}