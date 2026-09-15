#version 120

uniform sampler2D colortex0;

varying vec2 texcoord;


#include "/core/config.glsl"
#include "/post/color_grade.glsl"


void main()
{

    vec3 color =
    texture2D(colortex0, texcoord).rgb;


    color =
    AetherisColorGrade(color);


    gl_FragData[0]
    =
    vec4(color,1.0);

}