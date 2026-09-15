#ifndef AETHERIS_WATER
#define AETHERIS_WATER


#include "/core/common.glsl"


// ===================================
// Aetheris Water System
// ===================================



struct AER_Water
{

    vec3 absorption;

    float roughness;

    float refraction;

};





AER_Water AER_DefaultWater()
{

    AER_Water water;


    water.absorption =
        vec3(
            0.05,
            0.15,
            0.25
        );


    water.roughness =
        0.05;


    water.refraction =
        1.333;



    return water;

}





vec3 AER_WaterFresnel(
    vec3 view,
    vec3 normal
)
{

    float cosTheta =
        max(
            dot(
                view,
                normal
            ),
            0.0
        );


    float fresnel =
        pow(
            1.0-cosTheta,
            5.0
        );



    return vec3(
        fresnel
    );

}





#endif