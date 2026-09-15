#ifndef AETHERIS_CAMERA
#define AETHERIS_CAMERA


#include "/core/uniforms.glsl"



// ===================================
// Aetheris Camera Reconstruction
// ===================================




vec3 getViewPosition(
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





vec3 getWorldPosition(
    vec2 uv,
    float depth
)
{

    vec3 view =
        getViewPosition(
            uv,
            depth
        );


    vec4 world =
        gbufferModelViewInverse *
        vec4(
            view,
            1.0
        );


    return world.xyz;

}





vec3 getViewDirection(
    vec3 viewPosition
)
{

    return normalize(
        -viewPosition
    );

}





float linearDepth(
    float depth
)
{

    vec3 pos =
        getViewPosition(
            vec2(0.5),
            depth
        );


    return -pos.z;

}





#endif