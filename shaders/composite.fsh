#version 120


uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;


varying vec2 texcoord;


void main()
{

    vec3 color =
        texture2D(
            colortex0,
            texcoord
        ).rgb;


    vec3 normal =
        texture2D(
            colortex1,
            texcoord
        ).rgb;


    float material =
        texture2D(
            colortex2,
            texcoord
        ).r;



    /*
        Aetheris Base Lighting

        注意：
        这里只处理 terrain
    */


    normal =
        normal * 2.0 - 1.0;



    vec3 sun =
        normalize(
            vec3(
                0.4,
                0.8,
                0.3
            )
        );



    float diffuse =
        max(
            dot(
                normal,
                sun
            ),
            0.0
        );



    float ambient =
        0.45;



    float lighting =
        ambient +
        diffuse * 0.55;



    color =
        mix(
            color,
            color * lighting,
            material
        );



    /*
        Architectural color grade
    */


    color.r *= 1.03;
    color.b *= 0.98;



    gl_FragData[0] =
        vec4(
            color,
            1.0
        );

}