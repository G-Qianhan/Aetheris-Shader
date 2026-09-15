#ifndef AETHERIS_NOISE
#define AETHERIS_NOISE


// ===================================
// Aetheris Noise Library
// ===================================


// -----------------------------------
// Hash
// -----------------------------------

float AER_Hash1(
    float n
)
{
    return fract(
        sin(n) *
        43758.5453123
    );
}



float AER_Hash2(
    vec2 p
)
{
    return fract(
        sin(
            dot(
                p,
                vec2(
                    127.1,
                    311.7
                )
            )
        ) *
        43758.5453123
    );
}



float AER_Hash3(
    vec3 p
)
{
    return fract(
        sin(
            dot(
                p,
                vec3(
                    127.1,
                    311.7,
                    74.7
                )
            )
        ) *
        43758.5453123
    );
}



// -----------------------------------
// 2D Value Noise
// -----------------------------------

float AER_Noise2D(
    vec2 p
)
{
    vec2 i =
        floor(p);

    vec2 f =
        fract(p);



    float a =
        AER_Hash2(i);

    float b =
        AER_Hash2(i + vec2(1.0, 0.0));

    float c =
        AER_Hash2(i + vec2(0.0, 1.0));

    float d =
        AER_Hash2(i + vec2(1.0, 1.0));



    vec2 u =
        f * f *
        (3.0 - 2.0 * f);



    return
        mix(a, b, u.x)
        +
        (c - a) * u.y * (1.0 - u.x)
        +
        (d - b) * u.x * u.y;
}



// -----------------------------------
// 3D Value Noise
// -----------------------------------

float AER_Noise3D(
    vec3 p
)
{
    vec3 i =
        floor(p);

    vec3 f =
        fract(p);



    float n000 =
        AER_Hash3(i + vec3(0.0, 0.0, 0.0));
    float n100 =
        AER_Hash3(i + vec3(1.0, 0.0, 0.0));
    float n010 =
        AER_Hash3(i + vec3(0.0, 1.0, 0.0));
    float n110 =
        AER_Hash3(i + vec3(1.0, 1.0, 0.0));

    float n001 =
        AER_Hash3(i + vec3(0.0, 0.0, 1.0));
    float n101 =
        AER_Hash3(i + vec3(1.0, 0.0, 1.0));
    float n011 =
        AER_Hash3(i + vec3(0.0, 1.0, 1.0));
    float n111 =
        AER_Hash3(i + vec3(1.0, 1.0, 1.0));



    vec3 u =
        f * f *
        (3.0 - 2.0 * f);



    float nx00 =
        mix(n000, n100, u.x);
    float nx10 =
        mix(n010, n110, u.x);
    float nx01 =
        mix(n001, n101, u.x);
    float nx11 =
        mix(n011, n111, u.x);

    float nxy0 =
        mix(nx00, nx10, u.y);
    float nxy1 =
        mix(nx01, nx11, u.y);

    return mix(
        nxy0,
        nxy1,
        u.z
    );
}



// -----------------------------------
// 2D FBM
// -----------------------------------

float AER_FBM2D(
    vec2 p
)
{
    float value = 0.0;
    float amplitude = 0.5;

    for(int i = 0; i < 5; i++)
    {
        value +=
            AER_Noise2D(p) *
            amplitude;

        p *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}



// -----------------------------------
// 3D FBM
// -----------------------------------

float AER_FBM3D(
    vec3 p
)
{
    float value = 0.0;
    float amplitude = 0.5;

    for(int i = 0; i < 5; i++)
    {
        value +=
            AER_Noise3D(p) *
            amplitude;

        p *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}



// -----------------------------------
// Ridged Noise
// 适合云边缘 / 山体 / 雪层变化
// -----------------------------------

float AER_Ridged2D(
    vec2 p
)
{
    float n =
        AER_FBM2D(p);

    n =
        1.0 -
        abs(
            n * 2.0 - 1.0
        );

    return n;
}



float AER_Ridged3D(
    vec3 p
)
{
    float n =
        AER_FBM3D(p);

    n =
        1.0 -
        abs(
            n * 2.0 - 1.0
        );

    return n;
}



#endif