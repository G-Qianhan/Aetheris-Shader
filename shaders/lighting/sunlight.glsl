#ifndef AETHERIS_SUNLIGHT
#define AETHERIS_SUNLIGHT


#include "/core/uniforms.glsl"
#include "/core/common.glsl"


// ===================================
// Aetheris Sun System
// ===================================



vec3 AER_GetSunDirection()
{

    return normalize(
        sunPosition
    );

}




vec3 AER_GetSunColor()
{

    return vec3(
        1.0,
        0.96,
        0.88
    );

}




float AER_SunIntensity()
{

    float height =
        clamp(
            sunPosition.y,
            0.0,
            1.0
        );


    return height;

}




#endif