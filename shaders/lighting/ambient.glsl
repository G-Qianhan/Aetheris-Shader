#ifndef AETHERIS_AMBIENT
#define AETHERIS_AMBIENT


#include "/core/common.glsl"
#include "/core/uniforms.glsl"



/*
    Aetheris Ambient Lighting

    Environment illumination

    后续接:
    - sky scattering
    - weather
    - time cycle
    - moon light

*/



vec3 AER_GetAmbientSky()
{

    return vec3(
        0.38,
        0.40,
        0.42
    );

}




vec3 AER_CalculateAmbient(
    vec3 albedo
)
{


    vec3 ambient =
        AER_GetAmbientSky();



    return
        albedo *
        ambient *
        0.65;


}



#endif