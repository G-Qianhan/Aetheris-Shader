#ifndef AETHERIS_GBUFFER
#define AETHERIS_GBUFFER


#include "/core/uniforms.glsl"
#include "/core/common.glsl"


// ===================================
// Aetheris GBuffer Reader
// ===================================



vec3 AER_GetAlbedo(
    vec2 uv
)
{

    return texture2D(
        colortex0,
        uv
    ).rgb;

}





vec3 AER_GetNormal(
    vec2 uv
)
{

    vec3 normal =
        texture2D(
            colortex1,
            uv
        ).rgb;


    return AER_Normalize(
        normal * 2.0 - 1.0
    );

}





vec2 AER_GetLightmap(
    vec2 uv
)
{

    return texture2D(
        colortex2,
        uv
    ).rg;

}





int AER_GetMaterialID(
    vec2 uv
)
{

    return int(
        texture2D(
            colortex2,
            uv
        ).b
        *
        255.0
    );

}





vec3 AER_GetWorldPosition(
    vec2 uv
)
{

    return texture2D(
        colortex3,
        uv
    ).xyz
    *
    100.0;

}





float AER_GetDepth(
    vec2 uv
)
{

    return texture2D(
        depthtex0,
        uv
    ).r;

}



#endif