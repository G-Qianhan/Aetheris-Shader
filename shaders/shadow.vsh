#version 120


varying vec4 shadowPosition;


void main()
{

    shadowPosition =
        gl_ModelViewProjectionMatrix *
        gl_Vertex;


    gl_Position =
        ftransform();

}