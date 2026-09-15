#ifndef AETHERIS_CLOUDS
#define AETHERIS_CLOUDS


#include "/core/common.glsl"
#include "/core/noise.glsl"



// ===================================
// Aetheris Universal Cloud System
// ===================================



// 云高度

#define AER_CLOUD_HEIGHT 180.0



// 云尺度

#define AER_CLOUD_SCALE 0.0035



// ===================================
// Cloud Density
// ===================================


float AER_CloudDensity(
    vec3 worldPosition,
    float time
)
{

    vec3 samplePosition =
        worldPosition *
        AER_CLOUD_SCALE;



    // 云移动

    samplePosition.x +=
        time *
        0.008;



    samplePosition.z +=
        time *
        0.004;




    float base =
        AER_FBM3D(
            samplePosition
        );



    float detail =
        AER_FBM3D(
            samplePosition * 3.0
        );



    float density =
        base * 0.75
        +
        detail * 0.25;



    return smoothstep(
        0.45,
        0.68,
        density
    );

}



// ===================================
// Cloud Lighting
// ===================================


vec3 AER_CloudLighting(
    float density,
    vec3 sunDirection
)
{


    float sunAmount =
        max(
            sunDirection.y,
            0.0
        );



    vec3 topLight =
        vec3(
            1.0,
            0.95,
            0.85
        );



    vec3 shadowLight =
        vec3(
            0.35,
            0.42,
            0.55
        );



    vec3 cloudColor =
        mix(
            shadowLight,
            topLight,
            sunAmount
        );



    return
        cloudColor *
        density;

}



// ===================================
// Cloud Alpha
// ===================================


float AER_CloudOpacity(
    float density
)
{

    return clamp(
        density *
        1.2,
        0.0,
        1.0
    );

}



// ===================================
// Cloud Layer Sample
// ===================================


vec4 AER_SampleCloud(
    vec3 worldPosition,
    vec3 sunDirection,
    float time
)
{


    float height =
        worldPosition.y;



    if(
        height <
        AER_CLOUD_HEIGHT
    )
    {
        return vec4(
            0.0
        );
    }




    float density =
        AER_CloudDensity(
            worldPosition,
            time
        );




    vec3 color =
        AER_CloudLighting(
            density,
            sunDirection
        );




    float alpha =
        AER_CloudOpacity(
            density
        );



    return vec4(
        color,
        alpha
    );

}



#endif