#ifndef AETHERIS_SCATTERING
#define AETHERIS_SCATTERING


#include "/core/common.glsl"


// ===================================
// Simple Atmospheric Scattering
// ===================================



vec3 AER_Rayleigh(
    vec3 viewDirection,
    vec3 sunDirection
)
{

    float phase =
        1.0 +
        pow(
            dot(
                viewDirection,
                sunDirection
            ),
            2.0
        );



    return vec3(
        0.25,
        0.45,
        1.0
    )
    *
    phase
    *
    0.12;

}



#endif