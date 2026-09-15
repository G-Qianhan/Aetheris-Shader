#version 120


// ===================================
// Aetheris Final Output
// ===================================


#include "/core/uniforms.glsl"

#include "/post/exposure.glsl"
#include "/post/aces.glsl"
#include "/post/bloom.glsl"
#include "/post/color_grade.glsl"



varying vec2 texcoord;



void main()
{


    vec3 color =
        texture2D(
            colortex0,
            texcoord
        ).rgb;



    // HDR exposure

    color =
        AER_Exposure(
            color
        );



    // Bloom

    vec3 bloom =
        AER_Bloom(
            texcoord
        );



    color +=
        bloom *
        0.08;



    // Tone mapping

    color =
        AER_ACES(
            color
        );



    // Color

    color =
        AER_ColorGrade(
            color
        );



    gl_FragColor =
        vec4(
            color,
            1.0
        );


}