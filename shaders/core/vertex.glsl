#ifndef AETHERIS_VERTEX
#define AETHERIS_VERTEX


#include "/core/common.glsl"
#include "/core/uniforms.glsl"


// ===================================
// Aetheris Vertex Utilities
// ===================================



vec3 AER_ObjectToWorld(
    vec3 position
)
{

    vec4 world =
        gbufferModelViewInverse *
        vec4(
            position,
            1.0
        );


    return world.xyz;

}





vec3 AER_TransformNormal(
    vec3 normal
)
{

    return normalize(
        gl_NormalMatrix *
        normal
    );

}





vec3 AER_GetVertexPosition()
{

    return gl_Vertex.xyz;

}



#endif