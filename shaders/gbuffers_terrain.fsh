#version 120


uniform sampler2D gtexture;


varying vec2 texcoord;
varying vec4 vertexColor;
varying vec3 normal;


void main()
{

    vec4 color =
        texture2D(
            gtexture,
            texcoord
        );


    color *= vertexColor;


    if(color.a < 0.1)
    {
        discard;
    }


    // Base color

    gl_FragData[0] =
        color;


    // Normal buffer

    vec3 n =
        normalize(normal);


    gl_FragData[1] =
        vec4(
            n * 0.5 + 0.5,
            1.0
        );


    // Material mask

    gl_FragData[2] =
        vec4(
            1.0,
            0.0,
            0.0,
            1.0
        );

}