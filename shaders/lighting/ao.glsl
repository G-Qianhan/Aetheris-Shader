#ifndef AETHERIS_AO
#define AETHERIS_AO


// ===================================
// Aetheris Shader
// Screen Space Ambient Occlusion
// ===================================


#include "/core/common.glsl"




// Iris depth

uniform sampler2D depthtex0;



// 屏幕尺寸

uniform vec2 viewSize;




// -----------------------------------
// AO Sample
// -----------------------------------

float sampleAO(
    vec2 uv,
    float depth
)
{

    float sampleDepth =
        texture2D(
            depthtex0,
            uv
        ).r;


    float difference =
        depth -
        sampleDepth;



    return clamp(
        difference * 5.0,
        0.0,
        1.0
    );

}





// -----------------------------------
// SSAO
// -----------------------------------

float calculateAO(
    vec2 uv
)
{

    float depth =
        texture2D(
            depthtex0,
            uv
        ).r;



    float ao = 0.0;



    float radius =
        3.0;



    vec2 texel =
        1.0 / viewSize;



    ao += sampleAO(
        uv + vec2(radius,0.0)*texel,
        depth
    );


    ao += sampleAO(
        uv - vec2(radius,0.0)*texel,
        depth
    );


    ao += sampleAO(
        uv + vec2(0.0,radius)*texel,
        depth
    );


    ao += sampleAO(
        uv - vec2(0.0,radius)*texel,
        depth
    );



    ao /= 4.0;



    return 1.0 - ao;

}





#endif