#ifndef AETHERIS_MATERIAL_DECODE
#define AETHERIS_MATERIAL_DECODE


#include "/material/material.glsl"
#include "/material/material_id.glsl"


// ===================================
// Aetheris Material Decoder
// ===================================



AER_Surface AER_DecodeMaterial(
    int id,
    vec3 albedo
)
{

    AER_Surface surface;



    // Default

    surface.albedo =
        albedo;

    surface.metallic =
        0.0;

    surface.roughness =
        0.85;

    surface.emission =
        0.0;



    // ==========================
    // Stone
    // ==========================

    if(id == AER_MAT_STONE)
    {

        surface.roughness =
            0.92;


        surface.metallic =
            0.0;

    }



    // ==========================
    // Wood
    // ==========================

    else if(id == AER_MAT_WOOD)
    {

        surface.roughness =
            0.65;


        surface.metallic =
            0.0;

    }




    // ==========================
    // Ice
    // ==========================

    else if(id == AER_MAT_ICE)
    {

        surface.albedo *=
            vec3(
                0.75,
                0.92,
                1.0
            );


        surface.roughness =
            0.05;


        surface.metallic =
            0.0;

    }




    // ==========================
    // Snow
    // ==========================

    else if(id == AER_MAT_SNOW)
    {

        surface.albedo *=
            vec3(
                1.05,
                1.05,
                1.08
            );


        surface.roughness =
            0.98;


    }





    // ==========================
    // Glass
    // ==========================

    else if(id == AER_MAT_GLASS)
    {

        surface.roughness =
            0.02;


        surface.metallic =
            0.0;

    }



    return surface;

}



#endif