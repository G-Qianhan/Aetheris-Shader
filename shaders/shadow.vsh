#version 120


// ===================================
// Aetheris Stable Shadow Vertex
// ===================================



uniform mat4 shadowModelView;

uniform mat4 shadowProjection;



varying vec4 shadowPosition;



void main()
{


    vec4 worldPosition =
        gl_ModelViewMatrix *
        gl_Vertex;



    vec4 shadow =
        shadowProjection *
        shadowModelView *
        worldPosition;



    shadowPosition =
        shadow;



    gl_Position =
        shadow;



}