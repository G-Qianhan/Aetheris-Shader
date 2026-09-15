#ifndef AETHERIS_SHADOW_FILTER
#define AETHERIS_SHADOW_FILTER



#include "/core/common.glsl"

#include "/core/uniforms.glsl"



// ===================================
// Shadow Filtering
// PCF
// ===================================



float AER_ShadowSample(
    vec3 coord
)
{


    float depth =
        texture2D(
            shadowtex0,
            coord.xy
        ).r;



    float bias =
        0.002;



    return step(
        coord.z - bias,
        depth
    );

}




float AER_PCFShadow(
    vec3 coord
)
{


    float result = 0.0;


    float texel =
        1.0 /
        2048.0;



    for(
        int x=-2;
        x<=2;
        x++
    )
    {


        for(
            int y=-2;
            y<=2;
            y++
        )
        {


            vec3 offset =
                coord;



            offset.xy +=
                vec2(
                    x,
                    y
                )
                *
                texel;



            result +=
                AER_ShadowSample(
                    offset
                );

        }

    }



    return result / 25.0;


}



#endif