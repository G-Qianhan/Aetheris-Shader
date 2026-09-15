#ifndef AETHERIS_SKY
#define AETHERIS_SKY


#include "/core/common.glsl"



// ===================================
// Aetheris Natural Sky
// ===================================



vec3 AER_BaseSky(
    vec3 direction
)
{


    float height =
        clamp(
            direction.y * 0.5 + 0.5,
            0.0,
            1.0
        );



    // 地平线

    vec3 horizon =
        vec3(
            0.62,
            0.68,
            0.76
        );



    // 天顶

    vec3 zenith =
        vec3(
            0.22,
            0.38,
            0.65
        );



    return mix(
        horizon,
        zenith,
        height
    );

}




vec3 AER_SunSkyGlow(
    vec3 direction,
    vec3 sunDirection
)
{

    float glow =
        pow(
            max(
                dot(
                    direction,
                    sunDirection
                ),
                0.0
            ),
            256.0
        );


    return vec3(
        1.0,
        0.85,
        0.65
    )
    *
    glow
    *
    0.35;

}




vec3 AER_RenderSky(
    vec3 direction,
    vec3 sunDirection,
    float time
)
{

    vec3 sky =
        AER_BaseSky(
            direction
        );



    sky +=
        AER_SunSkyGlow(
            direction,
            sunDirection
        );



    return sky;

}



#endif