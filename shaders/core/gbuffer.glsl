#ifndef AETHERIS_GBUFFER
#define AETHERIS_GBUFFER


#include "/core/uniforms.glsl"


// ===================================
// Aetheris GBuffer Reader
// ===================================



vec3 getAlbedo(vec2 uv)
{

    return texture2D(
        colortex0,
        uv
    ).rgb;

}





vec3 getNormal(vec2 uv)
{

    vec3 n =
        texture2D(
            colortex1,
            uv
        ).rgb;


    return normalize(
        n * 2.0 - 1.0
    );

}





float getDepth(vec2 uv)
{

    return texture2D(
        depthtex0,
        uv
    ).r;

}





float isSky(vec2 uv)
{

    float depth =
        getDepth(uv);


    return step(
        0.99999,
        depth
    );

}





#endif