#ifndef AETHERIS_CAMERA
#define AETHERIS_CAMERA


vec3 ReconstructViewPosition(
    vec2 uv,
    float depth
)
{

    vec4 clip =
        vec4(
            uv * 2.0 - 1.0,
            depth * 2.0 - 1.0,
            1.0
        );


    vec4 view =
        gbufferProjectionInverse *
        clip;


    view /= view.w;


    return view.xyz;

}


#endif