#ifndef AETHERIS_CAMERA
#define AETHERIS_CAMERA


// ===================================
// Aetheris Shader
// Camera Reconstruction
// ===================================



// Iris 提供

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;





// -----------------------------------
// Depth -> View Space Position
// -----------------------------------

vec3 reconstructViewPosition(
    vec2 uv,
    float depth
)
{

    // 屏幕空间
    vec4 clipPosition =
        vec4(
            uv * 2.0 - 1.0,
            depth * 2.0 - 1.0,
            1.0
        );


    // 逆投影
    vec4 viewPosition =
        gbufferProjectionInverse *
        clipPosition;


    viewPosition /=
        viewPosition.w;


    return viewPosition.xyz;

}





// -----------------------------------
// View Space -> World Space
// -----------------------------------

vec3 reconstructWorldPosition(
    vec2 uv,
    float depth
)
{

    vec3 viewPosition =
        reconstructViewPosition(
            uv,
            depth
        );


    vec4 worldPosition =
        gbufferModelViewInverse *
        vec4(
            viewPosition,
            1.0
        );


    return worldPosition.xyz;

}





// -----------------------------------
// Depth Linearization
// -----------------------------------

float linearizeDepth(
    float depth
)
{

    vec4 clip =
        vec4(
            0.0,
            0.0,
            depth * 2.0 - 1.0,
            1.0
        );


    vec4 view =
        gbufferProjectionInverse *
        clip;


    return -view.z / view.w;

}




#endif