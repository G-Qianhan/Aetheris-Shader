#ifndef AETHERIS_CAMERA
#define AETHERIS_CAMERA


#include "/core/uniforms.glsl"
#include "/core/common.glsl"


// ===================================
// Aetheris Camera System
// ===================================



vec3 AER_ReconstructViewPosition(
    vec2 uv,
    float depth
)
{

    vec4 clip =
        vec4(
            uv * 2.0 - 1.0,
            depth * 2.0 - 1.0,
            1.0
        );



    vec4 view =
        gbufferProjectionInverse *
        clip;



    view /= view.w;



    return view.xyz;

}





vec3 AER_ReconstructWorldPosition(
    vec2 uv,
    float depth
)
{

    vec3 view =
        AER_ReconstructViewPosition(
            uv,
            depth
        );



    vec4 world =
        gbufferModelViewInverse *
        vec4(
            view,
            1.0
        );



    return
        world.xyz +
        cameraPosition;

}





vec3 AER_ViewDirection(
    vec3 worldPosition
)
{

    return AER_Normalize(
        cameraPosition -
        worldPosition
    );

}





// ===================================
// Sky Ray
// ===================================


vec3 AER_GetViewRay(
    vec2 uv
)
{

    vec4 clip =
        vec4(
            uv * 2.0 - 1.0,
            1.0,
            1.0
        );



    vec4 view =
        gbufferProjectionInverse *
        clip;



    view /= view.w;



    vec4 world =
        gbufferModelViewInverse *
        vec4(
            view.xyz,
            0.0
        );



    return AER_Normalize(
        world.xyz
    );

}



#endif