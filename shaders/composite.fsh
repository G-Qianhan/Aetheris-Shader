#version 120


// ===================================
// Aetheris Composite Renderer
// Full Deferred Pipeline
// ===================================


#include "/core/common.glsl"
#include "/core/uniforms.glsl"

#include "/core/gbuffer.glsl"
#include "/core/camera.glsl"
#include "/core/lightmap.glsl"



#include "/lighting/sunlight.glsl"
#include "/lighting/direct_light.glsl"
#include "/lighting/ambient.glsl"
#include "/lighting/shadow.glsl"



#include "/material/material.glsl"
#include "/material/material_decode.glsl"
#include "/material/emission.glsl"



#include "/atmosphere/sky.glsl"
#include "/atmosphere/fog.glsl"
#include "/atmosphere/scattering.glsl"
#include "/atmosphere/volumetric.glsl"



varying vec2 texcoord;



void main()
{


    // =================================
    // Read GBuffer
    // =================================


    vec3 albedo =
        AER_GetAlbedo(
            texcoord
        );



    vec3 normal =
        AER_GetNormal(
            texcoord
        );



    vec2 lightmap =
        AER_GetLightmap(
            texcoord
        );



    float depth =
        AER_GetDepth(
            texcoord
        );





    vec3 viewRay =
        AER_GetViewRay(
            texcoord
        );



    vec3 sunDirection =
        AER_GetSunDirection();





    // =================================
    // Sky
    // =================================


    if(depth >= 0.99999)
    {


        vec3 sky =
            AER_RenderSky(
                viewRay,
                sunDirection,
                frameTimeCounter
            );



        sky +=
            AER_Rayleigh(
                viewRay,
                sunDirection
            );



        sky +=
            AER_VolumetricLight(
                viewRay,
                sunDirection
            );



        gl_FragData[0]
            =
            vec4(
                sky,
                1.0
            );


        return;

    }





    // =================================
    // World Position
    // =================================


    vec3 worldPosition =
        AER_GetWorldPosition(
            texcoord
        );



    vec3 viewDirection =
        AER_Normalize(
            cameraPosition -
            worldPosition
        );





    // =================================
    // Material
    // =================================


    int materialID =
        AER_GetMaterialID(
            texcoord
        );



    AER_Surface surface =
        AER_DecodeMaterial(
            materialID,
            albedo
        );





    // =================================
    // Direct PBR Light
    // =================================


    vec3 sunColor =
        AER_GetSunColor();



    vec3 direct =
        AER_CalculateDirectLight(
            surface,
            normal,
            viewDirection,
            sunDirection,
            sunColor
        );





    // =================================
    // Shadow
    // =================================


    float shadow =
        AER_CalculateShadow(
            worldPosition
        );





    // =================================
    // Ambient
    // =================================


    vec3 ambient =
        AER_CalculateAmbient(
            surface.albedo
        );





    // =================================
    // Minecraft Light
    // =================================


    vec3 blockLight =
        AER_CalculateMinecraftLight(
            lightmap
        );





    // =================================
    // Emission
    // =================================


    vec3 emission =
        AER_EmissionColor(
            materialID,
            surface.albedo
        );





    // =================================
    // Combine HDR
    // =================================


    vec3 color =
        ambient
        +
        direct * shadow
        +
        blockLight
        +
        emission;





    // =================================
    // Atmosphere Fog
    // =================================


    float distance =
        length(
            cameraPosition -
            worldPosition
        );



    vec3 fogColor =
        AER_BaseSky(
            viewDirection
        );



    color =
        AER_ApplyFog(
            color,
            fogColor,
            distance
        );





    // =================================
    // Clamp
    // =================================


    color =
        max(
            color,
            vec3(
                0.001
            )
        );





    gl_FragData[0]
        =
        vec4(
            color,
            1.0
        );


}