#version 120


uniform sampler2D gtexture;



varying vec2 texcoord;

varying vec4 vertexColor;

varying vec3 normal;

varying vec2 lightmap;

varying vec3 worldPos;



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





    // Albedo

    gl_FragData[0]
        =
        color;





    // Normal

    vec3 n =
        normalize(
            normal
        );


    gl_FragData[1]
        =
        vec4(
            n * 0.5 + 0.5,
            1.0
        );





    // Lightmap

    gl_FragData[2]
        =
        vec4(
            lightmap.x,
            lightmap.y,
            0.0,
            1.0
        );





    // World Position

    gl_FragData[3]
        =
        vec4(
            worldPos * 0.01,
            1.0
        );


}