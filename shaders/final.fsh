#version 120


uniform sampler2D colortex0;

varying vec2 texcoord;



void main()
{

    vec3 color =
        texture2D(
            colortex0,
            texcoord
        ).rgb;


    /*
        Aetheris basic contrast
    */


    color =
        pow(
            color,
            vec3(1.0 / 2.2)
        );


    color =
        (color - 0.5) * 1.08 + 0.5;



    gl_FragData[0] =
        vec4(
            color,
            1.0
        );

}