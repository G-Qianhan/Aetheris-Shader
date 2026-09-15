#version 120


#include "/core/vertex.glsl"


// ===================================
// Aetheris Terrain Vertex Pipeline
// ===================================



varying vec2 texcoord;

varying vec4 vertexColor;

varying vec3 normal;

varying vec2 lightmap;


varying vec3 worldPos;



void main()
{


    // Position

    gl_Position =
        ftransform();




    // Texture

    texcoord =
        gl_MultiTexCoord0.xy;



    // Minecraft Lightmap

    lightmap =
        gl_MultiTexCoord1.xy;




    // Color

    vertexColor =
        gl_Color;




    // Normal

    normal =
        AER_TransformNormal(
            gl_Normal
        );





    // World Position

    worldPos =
        AER_ObjectToWorld(
            gl_Vertex.xyz
        );


}