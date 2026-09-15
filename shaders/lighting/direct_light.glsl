#ifndef AETHERIS_DIRECT_LIGHT
#define AETHERIS_DIRECT_LIGHT


// ===================================
// Aetheris Shader
// Direct Lighting Model
// ===================================



#include "/core/common.glsl"




// -----------------------------------
// Lambert Diffuse
// -----------------------------------

float diffuseLambert(
    vec3 normal,
    vec3 lightDirection
)
{

    return max(
        dot(
            normal,
            lightDirection
        ),
        0.0
    );

}





// -----------------------------------
// Blinn-Phong Specular
// -----------------------------------

float specularBlinn(
    vec3 normal,
    vec3 viewDirection,
    vec3 lightDirection,
    float roughness
)
{

    vec3 halfVector =
        safeNormalize(
            viewDirection +
            lightDirection
        );


    float NdotH =
        max(
            dot(
                normal,
                halfVector
            ),
            0.0
        );


    float power =
        mix(
            128.0,
            8.0,
            roughness
        );


    return pow(
        NdotH,
        power
    );

}





// -----------------------------------
// Direct Sun Light
// -----------------------------------

vec3 calculateDirectLight(
    vec3 albedo,
    vec3 normal,
    vec3 viewDirection,
    vec3 lightDirection,
    vec3 lightColor,
    float roughness
)
{


    float diffuse =
        diffuseLambert(
            normal,
            lightDirection
        );



    float specular =
        specularBlinn(
            normal,
            viewDirection,
            lightDirection,
            roughness
        );



    vec3 diffuseLight =
        albedo *
        diffuse;



    vec3 specularLight =
        lightColor *
        specular *
        0.08;



    return
        diffuseLight +
        specularLight;

}





#endif