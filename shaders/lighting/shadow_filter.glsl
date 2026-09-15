#ifndef AETHERIS_SHADOW_FILTER
#define AETHERIS_SHADOW_FILTER


#include "/core/uniforms.glsl"
#include "/core/common.glsl"


// ===================================
// Aetheris PCF Shadow Filter
// ===================================



float shadowSample(
    vec3 coord
)
{

    float depth =
        texture2D(
            shadowtex0,
            coord.xy
        ).r;


    float bias =
        0.0015;



    return step(
        coord.z - bias,
        depth
    );

}




float PCF3x3(
    vec3 coord
)
{

    float result = 0.0;


    float size =
        1.0 / 2048.0;



    for(int x=-1;x<=1;x++)
    {

        for(int y=-1;y<=1;y++)
        {


            vec3 offset =
                coord;


            offset.xy +=
                vec2(
                    x,
                    y
                )
                *
                size;



            result +=
                shadowSample(
                    offset
                );


        }

    }



    return result / 9.0;

}





float PCF5x5(
    vec3 coord
)
{

    float result = 0.0;


    float size =
        1.0 / 2048.0;



    for(int x=-2;x<=2;x++)
    {

        for(int y=-2;y<=2;y++)
        {

            vec3 offset =
                coord;


            offset.xy +=
                vec2(
                    x,
                    y
                )
                *
                size;



            result +=
                shadowSample(
                    offset
                );


        }

    }



    return result / 25.0;

}



#endif