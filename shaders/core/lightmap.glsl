#ifndef AETHERIS_LIGHTMAP
#define AETHERIS_LIGHTMAP


#include "/core/common.glsl"



// ===================================
// Minecraft Light System
// ===================================



vec3 AER_GetBlockLight(
    float value
)
{

    return vec3(
        value * 1.0,
        value * 0.55,
        value * 0.25
    );

}





vec3 AER_GetSkyLight(
    float value
)
{

    return vec3(
        value * 0.35,
        value * 0.45,
        value * 0.75
    );

}





vec3 AER_CalculateMinecraftLight(
    vec2 lightmap
)
{

    vec3 block =
        AER_GetBlockLight(
            lightmap.x
        );


    vec3 sky =
        AER_GetSkyLight(
            lightmap.y
        );


    return block + sky;

}



#endif