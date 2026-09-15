#version 120


varying vec2 texcoord;
varying vec4 vertexColor;
varying vec3 normal;

varying vec2 lightmapCoord;



void main()
{

    gl_Position =
        ftransform();



    texcoord =
        gl_MultiTexCoord0.xy;



    lightmapCoord =
        gl_MultiTexCoord1.xy;



    vertexColor =
        gl_Color;



    normal =
        gl_NormalMatrix *
        gl_Normal;

}