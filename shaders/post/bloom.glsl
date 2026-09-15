#ifndef AETHERIS_BLOOM
#define AETHERIS_BLOOM



#include "/core/uniforms.glsl"


// ===================================
// Simple HDR Bloom
// ===================================



vec3 AER_Bloom(
    vec2 uv
)
{

    vec3 result =
        vec3(0.0);



    float offset =
        1.0 /
        viewSize.x;



    result +=
        texture2D(
            colortex0,
            uv +
            vec2(
                offset,
                0.0
            )
        ).rgb;



    result +=
        texture2D(
            colortex0,
            uv -
            vec2(
                offset,
                0.0
            )
        ).rgb;



    result +=
        texture2D(
            colortex0,
            uv +
            vec2(
                0.0,
                offset
            )
        ).rgb;



    result +=
        texture2D(
            colortex0,
            uv -
            vec2(
                0.0,
                offset
            )
        ).rgb;



    return
        result *
        0.25;

}



#endif