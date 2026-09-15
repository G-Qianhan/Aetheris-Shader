#ifndef AETHERIS_AMBIENT
#define AETHERIS_AMBIENT


#include "/core/common.glsl"



/*
    Sky ambient

    后续接:
    sky scattering
    weather
    time
*/



vec3 AER_GetAmbientSky()
{

    return vec3(
        0.10,
        0.13,
        0.20
    );

}




vec3 AER_CalculateAmbient(
    vec3 albedo
)
{

    return
        albedo *
        AER_GetAmbientSky();

}



#endif