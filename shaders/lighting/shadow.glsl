#ifndef AETHERIS_SHADOW
#define AETHERIS_SHADOW


#include "/core/common.glsl"
#include "/core/uniforms.glsl"

#include "/lighting/shadow_filter.glsl"


// ===================================
// Aetheris Shadow Engine v2
// ===================================




vec3 worldToShadow(
    vec3 worldPosition
)
{

    vec4 shadowPosition =
        shadowProjection *
        shadowModelView *
        vec4(
            worldPosition,
            1.0
        );


    shadowPosition.xyz /=
        shadowPosition.w;


    return
        shadowPosition.xyz
        *
        0.5
        +
        0.5;

}





float shadowFade(
    float distance
)
{

    return clamp(
        1.0 -
        distance / 180.0,
        0.0,
        1.0
    );

}





float calculateShadow(
    vec3 worldPosition
)
{


    vec3 coord =
        worldToShadow(
            worldPosition
        );



    if(
        coord.x < 0.0 ||
        coord.x > 1.0 ||
        coord.y < 0.0 ||
        coord.y > 1.0 ||
        coord.z < 0.0 ||
        coord.z > 1.0
    )
    {

        return 1.0;

    }




    float shadow =
        PCF5x5(
            coord
        );




    return shadow;

}



#endif