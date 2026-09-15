#ifndef AETHERIS_SUNLIGHT
#define AETHERIS_SUNLIGHT


// ===================================
// Aetheris Sun System
// ===================================



#include "/core/common.glsl"



// Minecraft Iris 提供太阳方向

uniform vec3 sunPosition;




vec3 getSunDirection()
{

    return safeNormalize(
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