#ifndef AETHERIS_SHADOW
#define AETHERIS_SHADOW



#include "/core/common.glsl"
#include "/core/uniforms.glsl"


#include "/lighting/shadow_filter.glsl"
#include "/lighting/shadow_stabilization.glsl"



// ===================================
// Aetheris Shadow Engine
// ===================================



vec3 AER_WorldToShadow(
    vec3 worldPosition
)
{

    vec4 shadowPosition =
        shadowProjection *
        shadowModelView *
        vec4(
            worldPosition,
            1.0
        );



    shadowPosition.xyz /=
        shadowPosition.w;



    vec3 coord =
        shadowPosition.xyz *
        0.5
        +
        0.5;



    return AER_StabilizeShadowCoord(
        coord
    );

}





float AER_ShadowDistanceFade(
    vec3 worldPosition
)
{

    float distance =
        length(
            cameraPosition -
            worldPosition
        );



    return clamp(
        1.0 -
        distance / 160.0,
        0.0,
        1.0
    );

}





float AER_CalculateShadow(
    vec3 worldPosition
)
{


    vec3 coord =
        AER_WorldToShadow(
            worldPosition
        );



    if(
        coord.x < 0.0 ||
        coord.x > 1.0 ||
        coord.y < 0.0 ||
        coord.y > 1.0 ||
        coord.z < 0.0 ||
        coord.z > 1.0
    )
    {

        return 1.0;

    }




    float shadow =
        AER_PCFShadow(
            coord
        );



    float fade =
        AER_ShadowDistanceFade(
            worldPosition
        );



    return mix(
        1.0,
        shadow,
        fade
    );


}



#endif