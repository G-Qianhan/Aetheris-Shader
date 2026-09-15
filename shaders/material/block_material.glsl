#ifndef AETHERIS_BLOCK_MATERIAL
#define AETHERIS_BLOCK_MATERIAL


#include "/material/material.glsl"
#include "/material/material_id.glsl"



// ===================================
// Minecraft Block Material Response
// ===================================



AER_Surface AER_GetBlockMaterial(
    int id,
    vec3 color
)
{

    AER_Surface surface;



    if(id == AER_MAT_ICE)
    {

        surface.albedo =
            color;


        surface.metallic =
            0.0;


        surface.roughness =
            0.08;


        surface.emission =
            0.0;

    }



    else if(id == AER_MAT_SNOW)
    {

        surface.albedo =
            color;


        surface.metallic =
            0.0;


        surface.roughness =
            0.95;


        surface.emission =
            0.0;

    }




    else if(id == AER_MAT_WOOD)
    {

        surface.albedo =
            color;


        surface.metallic =
            0.0;


        surface.roughness =
            0.7;


        surface.emission =
            0.0;

    }




    else
    {

        surface.albedo =
            color;


        surface.metallic =
            0.0;


        surface.roughness =
            0.85;


        surface.emission =
            0.0;

    }



    return surface;

}



#endif