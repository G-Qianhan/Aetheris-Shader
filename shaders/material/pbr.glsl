#ifndef AETHERIS_PBR
#define AETHERIS_PBR


#include "/core/common.glsl"
#include "/material/brdf.glsl"
#include "/material/material.glsl"



// ===================================
// Aetheris PBR Lighting
// ===================================



vec3 AER_CalculatePBR(
    AER_Surface surface,
    vec3 N,
    vec3 V,
    vec3 L,
    vec3 lightColor
)
{


    vec3 H =
        AER_Normalize(
            V+L
        );



    vec3 F0 =
        mix(
            vec3(0.04),
            surface.albedo,
            surface.metallic
        );



    vec3 F =
        AER_FresnelSchlick(
            max(
                dot(H,V),
                0.0
            ),
            F0
        );



    float D =
        AER_DistributionGGX(
            N,
            H,
            surface.roughness
        );



    float G =
        AER_GeometrySmith(
            N,
            V,
            L,
            surface.roughness
        );



    vec3 numerator =
        D *
        G *
        F;



    float denominator =
        4.0 *
        max(dot(N,V),0.0) *
        max(dot(N,L),0.0)
        +
        0.001;



    vec3 specular =
        numerator /
        denominator;




    vec3 kd =
        vec3(1.0)
        -
        F;



    kd *=
        1.0 -
        surface.metallic;



    float NdotL =
        max(
            dot(N,L),
            0.0
        );



    return
        (
            kd *
            surface.albedo /
            AER_PI
            +
            specular
        )
        *
        lightColor
        *
        NdotL;

}



#endif