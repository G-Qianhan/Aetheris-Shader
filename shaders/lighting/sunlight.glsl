#ifndef AETHERIS_SUNLIGHT
#define AETHERIS_SUNLIGHT


#include "/core/common.glsl"


// ===================================
// Aetheris Sun System
// ===================================



vec3 getSunDirection()
{

    return AER_SafeNormalize(
        sunPosition
    );

}




vec3 getSunColor()
{

    return vec3(
        1.0,
        0.92,
        0.78
    );

}




float getSunIntensity()
{

    return 1.0;

}



#endif