#ifndef AETHERIS_SHADOW_STABILIZATION
#define AETHERIS_SHADOW_STABILIZATION


#include "/core/common.glsl"


// ===================================
// Shadow Texel Stabilization
// ===================================



vec3 AER_SnapShadowPosition(
    vec3 position,
    float resolution
)
{

    vec2 texelSize =
        vec2(
            1.0 / resolution
        );



    position.xy =
        floor(
            position.xy /
            texelSize
        )
        *
        texelSize;



    return position;

}




vec3 AER_StabilizeShadowCoord(
    vec3 coord
)
{

    return AER_SnapShadowPosition(
        coord,
        2048.0
    );

}



#endif