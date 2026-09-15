#ifndef AETHERIS_SKY
#define AETHERIS_SKY


#include "/core/common.glsl"

#include "/atmosphere/clouds.glsl"



// ===================================
// Aetheris Sky
// ===================================



vec3 AER_BaseSky(
    vec3 direction
)
{


    float h =
        clamp(
            direction.y * 0.5 + 0.5,
            0.0,
            1.0
        );



    vec3 horizon =
        vec3(
            0.55,
            0.62,
            0.72
        );



    vec3 zenith =
        vec3(
            0.16,
            0.30,
            0.58
        );



    return mix(
        horizon,
        zenith,
        h
    );

}





vec3 AER_SunDisk(
    vec3 direction,
    vec3 sunDirection
)
{


    float sun =
        dot(
            direction,
            sunDirection
        );



    float disk =
        smoothstep(
            0.9995,
            1.0,
            sun
        );



    return vec3(
        1.0,
        0.85,
        0.65
    )
    *
    disk
    *
    4.0;

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
        AER_SunDisk(
            direction,
            sunDirection
        );



    return sky;

}



#endif