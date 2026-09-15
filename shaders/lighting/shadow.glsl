#ifndef AETHERIS_SHADOW
#define AETHERIS_SHADOW


#include "/core/common.glsl"
#include "/core/uniforms.glsl"





vec3 worldToShadow(
    vec3 worldPosition
)
{

    vec4 shadowPosition =
        shadowProjection *
        shadowModelView *
        vec4(
            worldPosition,
            1.0
        );


    shadowPosition.xyz /=
        shadowPosition.w;


    return
        shadowPosition.xyz * 0.5
        +
        0.5;

}





float shadowCompare(
    vec3 shadowCoord
)
{

    float depth =
        texture2D(
            shadowtex0,
            shadowCoord.xy
        ).r;



    float current =
        shadowCoord.z;



    if(
        current - 0.002 >
        depth
    )
    {
        return 0.0;
    }


    return 1.0;

}





float calculateShadow(
    vec3 worldPosition
)
{

    vec3 coord =
        worldToShadow(
            worldPosition
        );



    if(
        coord.x < 0.0 ||
        coord.x > 1.0 ||
        coord.y < 0.0 ||
        coord.y > 1.0 ||
        coord.z < 0.0 ||
        coord.z > 1.0
    )
    {
        return 1.0;
    }



    return shadowCompare(
        coord
    );

}



#endif