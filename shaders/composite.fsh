#version 120


// ===================================
// Aetheris Shader
// Deferred Lighting Composite
// ===================================


#include "/core/common.glsl"
#include "/core/uniforms.glsl"
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

    // ==============================
    // GBuffer Data
    // ==============================


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



    // ==============================
    // Sky Pass Protection
    // ==============================


    if(depth >= 0.99999)
    {

        gl_FragData[0] =
            vec4(
                albedo,
                1.0
            );

        return;

    }




    // ==============================
    // Position Reconstruction
    // ==============================


    vec3 worldPosition =
        getWorldPosition(
            texcoord,
            depth
        );



    vec3 viewDirection =
        AER_SafeNormalize(
            -worldPosition
        );





    // ==============================
    // Sun Lighting
    // ==============================


    vec3 sunDirection =
        getSunDirection();



    vec3 sunColor =
        getSunColor();



    vec3 directLight =
        calculateDirectLight(
            albedo,
            normal,
            viewDirection,
            sunDirection,
            sunColor,
            0.8
        );





    // ==============================
    // Ambient
    // ==============================


    vec3 ambientLight =
        calculateAmbient(
            albedo
        );





    // ==============================
    // Shadow
    // ==============================


    float shadow =
        calculateShadow(
            worldPosition
        );





    // ==============================
    // Minecraft Lightmap
    // ==============================


    vec2 lightmap =
        getLightmap(
            texcoord
        );


    vec3 blockLight =
        vec3(
            lightmap.x,
            lightmap.x * 0.75,
            lightmap.x * 0.45
        );


    vec3 skyLight =
        vec3(
            lightmap.y * 0.45,
            lightmap.y * 0.55,
            lightmap.y * 0.75
        );



    vec3 minecraftLight =
        blockLight +
        skyLight;





    // ==============================
    // Ambient Occlusion
    // ==============================


    float ao =
        calculateAO(
            texcoord
        );





    // ==============================
    // Final Lighting Combine
    // ==============================


    vec3 color =
        ambientLight
        +
        directLight * shadow
        +
        minecraftLight;



    color *= ao;



    // 防止过暗

    color =
        max(
            color,
            vec3(0.001)
        );





    gl_FragData[0] =
        vec4(
            color,
            1.0
        );

}