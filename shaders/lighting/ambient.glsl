#ifndef AETHERIS_AMBIENT
#define AETHERIS_AMBIENT


// ===================================
// Aetheris Ambient Lighting
// ===================================


#include "/core/common.glsl"





vec3 getAmbientColor()
{

    return vec3(
        0.35,
        0.42,
        0.55
    );

}





vec3 calculateAmbient(
    vec3 albedo
)
{

    return
        albedo *
        getAmbientColor();

}





#endif