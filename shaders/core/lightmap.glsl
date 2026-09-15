#ifndef AETHERIS_LIGHTMAP
#define AETHERIS_LIGHTMAP


#include "/core/common.glsl"


varying vec2 lightmapCoord;



float getSkyLight()
{
    return lightmapCoord.y;
}



float getBlockLight()
{
    return lightmapCoord.x;
}



vec3 getMinecraftLight()
{

    float sky =
        getSkyLight();


    float block =
        getBlockLight();



    vec3 skyColor =
        vec3(
            0.45,
            0.55,
            0.75
        );



    vec3 blockColor =
        vec3(
            1.0,
            0.55,
            0.25
        );



    return
        sky * skyColor
        +
        block * blockColor;

}



#endif