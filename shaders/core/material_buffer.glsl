#ifndef AETHERIS_MATERIAL_BUFFER
#define AETHERIS_MATERIAL_BUFFER


#include "/material/material.glsl"
#include "/material/material_id.glsl"



int AER_ReadMaterialID(
    vec2 uv
)
{

    vec4 data =
        texture2D(
            colortex2,
            uv
        );


    return int(
        data.b * 255.0
    );

}




AER_Surface AER_SurfaceFromID(
    int id,
    vec3 albedo
)
{

    AER_Surface surface;


    surface.albedo =
        albedo;


    surface.metallic =
        0.0;


    surface.roughness =
        0.85;


    surface.emission =
        0.0;



    // =========================
    // Ice
    // =========================

    if(id == AER_MAT_ICE)
    {

        surface.roughness =
            0.08;


        surface.albedo *=
            vec3(
                0.82,
                0.95,
                1.0
            );

    }



    // =========================
    // Snow
    // =========================

    else if(id == AER_MAT_SNOW)
    {

        surface.roughness =
            0.95;


        surface.albedo *=
            vec3(
                1.0,
                1.0,
                1.05
            );

    }




    // =========================
    // Wood
    // =========================

    else if(id == AER_MAT_WOOD)
    {

        surface.roughness =
            0.65;

    }





    // =========================
    // Stone
    // =========================

    else if(id == AER_MAT_STONE)
    {

        surface.roughness =
            0.9;

    }



    return surface;

}



#endif