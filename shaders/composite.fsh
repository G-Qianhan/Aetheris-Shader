#version 120


#include "/core/gbuffer.glsl"
#include "/core/camera.glsl"


#include "/lighting/direct_light.glsl"
#include "/lighting/sunlight.glsl"
#include "/lighting/ambient.glsl"
#include "/lighting/shadow.glsl"
#include "/lighting/ao.glsl"



varying vec2 texcoord;



void main()
{

    // ----------------------------
    // Read GBuffer
    // ----------------------------


    vec3 albedo =
        getAlbedo(
            texcoord
        );


    vec3 normal =
        getNormal(
            texcoord
        );


    float depth =
        getDepth(
            texcoord
        );



    // ----------------------------
    // Position reconstruction
    // ----------------------------


    vec3 worldPosition =
        reconstructWorldPosition(
            texcoord,
            depth
        );



    vec3 viewDirection =
        safeNormalize(
            -worldPosition
        );



    // ----------------------------
    // Lighting
    // ----------------------------


    vec3 sunDirection =
        getSunDirection();



    vec3 sunColor =
        getSunColor();




    vec3 direct =
        calculateDirectLight(
            albedo,
            normal,
            viewDirection,
            sunDirection,
            sunColor,
            0.8
        );



    vec3 ambient =
        calculateAmbient(
            albedo
        );



    float shadow =
        calculateShadow(
            worldPosition
        );



    float ao =
        calculateAO(
            texcoord
        );



    vec3 color =
        ambient
        +
        direct * shadow;



    color *= ao;



    gl_FragData[0] =
        vec4(
            color,
            1.0
        );

}