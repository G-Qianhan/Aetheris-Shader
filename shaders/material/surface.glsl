#ifndef AETHERIS_SURFACE
#define AETHERIS_SURFACE


#include "/core/common.glsl"
#include "/material/material.glsl"


// ===================================
// Aetheris Surface Processing
// ===================================



float AER_CalculateRoughness(
    vec3 albedo
)
{

    float brightness =
        AER_Luminance(
            albedo
        );


    /*
        暂时基础版本

        后续接：
        material ID
        block.properties
    */


    return mix(
        0.95,
        0.65,
        brightness
    );

}





AER_Surface AER_CreateSurface(
    vec3 albedo
)
{

    AER_Surface surface =
        AER_DefaultSurface(
            albedo
        );



    surface.roughness =
        AER_CalculateRoughness(
            albedo
        );



    return surface;

}





// ===================================
// Special Materials
// ===================================



AER_Surface AER_CreateIceSurface(
    vec3 color
)
{

    AER_Surface surface;


    surface.albedo =
        color;


    surface.metallic =
        0.0;


    surface.roughness =
        0.08;


    surface.emission =
        0.0;



    return surface;

}





AER_Surface AER_CreateSnowSurface(
    vec3 color
)
{

    AER_Surface surface;


    surface.albedo =
        color;


    surface.metallic =
        0.0;


    surface.roughness =
        0.95;


    surface.emission =
        0.0;



    return surface;

}



#endif