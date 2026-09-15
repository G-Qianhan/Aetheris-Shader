#ifndef AETHERIS_FOG
#define AETHERIS_FOG


#include "/core/common.glsl"



// ===================================
// Aetheris Atmospheric Fog
// ===================================



float AER_FogFactor(
    float distance
)
{

    return 1.0 -
        exp(
            -distance *
            0.0025
        );

}





vec3 AER_ApplyFog(
    vec3 color,
    vec3 fogColor,
    float distance
)
{

    float fog =
        AER_FogFactor(
            distance
        );


    return mix(
        color,
        fogColor,
        fog
    );

}



#endif