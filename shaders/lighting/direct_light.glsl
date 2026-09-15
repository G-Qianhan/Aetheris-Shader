#ifndef AETHERIS_DIRECT_LIGHT
#define AETHERIS_DIRECT_LIGHT


#include "/core/common.glsl"

#include "/material/material.glsl"
#include "/material/brdf.glsl"
#include "/material/pbr.glsl"


// ===================================
// Aetheris PBR Direct Lighting
// ===================================



vec3 AER_CalculateDirectLight(
    AER_Surface surface,
    vec3 normal,
    vec3 viewDirection,
    vec3 lightDirection,
    vec3 lightColor
)
{

    return AER_CalculatePBR(
        surface,
        normal,
        viewDirection,
        lightDirection,
        lightColor
    );

}



#endif