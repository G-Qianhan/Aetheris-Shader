#ifndef AETHERIS_AMBIENT
#define AETHERIS_AMBIENT


#include "/core/common.glsl"


vec3 getAmbientColor()
{

    return vec3(
        0.08,
        0.10,
        0.15
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