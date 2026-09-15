#ifndef AETHERIS_BRDF
#define AETHERIS_BRDF


#include "/core/common.glsl"


// ===================================
// Aetheris BRDF
// GGX Microfacet Model
// ===================================



float AER_DistributionGGX(
    vec3 N,
    vec3 H,
    float roughness
)
{

    float a =
        roughness *
        roughness;


    float a2 =
        a * a;


    float NdotH =
        max(
            dot(N,H),
            0.0
        );


    float NdotH2 =
        NdotH*NdotH;



    float denom =
        NdotH2 *
        (a2 - 1.0)
        + 1.0;



    return
        a2 /
        (
            AER_PI *
            denom *
            denom
        );

}





float AER_GeometrySchlick(
    float NdotV,
    float roughness
)
{

    float r =
        roughness + 1.0;


    float k =
        (r*r)/8.0;



    return
        NdotV /
        (
            NdotV *
            (1.0-k)
            +
            k
        );

}





float AER_GeometrySmith(
    vec3 N,
    vec3 V,
    vec3 L,
    float roughness
)
{

    float NdotV =
        max(
            dot(N,V),
            0.0
        );


    float NdotL =
        max(
            dot(N,L),
            0.0
        );


    float ggx1 =
        AER_GeometrySchlick(
            NdotV,
            roughness
        );


    float ggx2 =
        AER_GeometrySchlick(
            NdotL,
            roughness
        );


    return ggx1 * ggx2;

}





vec3 AER_FresnelSchlick(
    float cosTheta,
    vec3 F0
)
{

    return
        F0 +
        (
            1.0-F0
        )
        *
        pow(
            1.0-cosTheta,
            5.0
        );

}



#endif