#ifndef AETHERIS_VOLUMETRIC
#define AETHERIS_VOLUMETRIC


#include "/core/common.glsl"


// ===================================
// Volumetric Light Approximation
// ===================================



vec3 AER_VolumetricLight(
    vec3 viewDirection,
    vec3 sunDirection
)
{

    float light =
        pow(
            max(
                dot(
                    viewDirection,
                    sunDirection
                ),
                0.0
            ),
            32.0
        );



    return vec3(
        1.0,
        0.85,
        0.65
    )
    *
    light
    *
    0.08;

}



#endif