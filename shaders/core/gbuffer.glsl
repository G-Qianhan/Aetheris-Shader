#ifndef AETHERIS_GBUFFER
#define AETHERIS_GBUFFER


// ===================================
// Aetheris GBuffer Interface
// ===================================


uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D depthtex0;




vec3 getAlbedo(
    vec2 uv
)
{

    return texture2D(
        colortex0,
        uv
    ).rgb;

}





vec3 getNormal(
    vec2 uv
)
{

    vec3 normal =
        texture2D(
            colortex1,
            uv
        ).rgb;



    return normalize(
        normal * 2.0 - 1.0
    );

}





float getDepth(
    vec2 uv
)
{

    return texture2D(
        depthtex0,
        uv
    ).r;

}



#endif