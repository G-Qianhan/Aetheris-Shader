#ifndef AETHERIS_EXPOSURE
#define AETHERIS_EXPOSURE


#include "/core/common.glsl"


// ===================================
// Aetheris HDR Exposure
// ===================================


float AER_ExposureLuminance(
    vec3 color
)
{

    return dot(
        color,
        vec3(
            0.2126,
            0.7152,
            0.0722
        )
    );

}



vec3 AER_Exposure(
    vec3 color
)
{

    float lum =
        AER_ExposureLuminance(
            color
        );


    float exposure =
        1.0 /
        (
            0.6 +
            lum
        );


    return color *
        exposure;

}



#endif