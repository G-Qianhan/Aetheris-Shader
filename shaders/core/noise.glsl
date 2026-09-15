#ifndef AETHERIS_NOISE
#define AETHERIS_NOISE


// ===================================
// Aetheris Noise Library
// ===================================



float hash(
    float n
)
{
    return fract(
        sin(n)
        *
        43758.5453123
    );
}




float hash(
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
        )
        *
        43758.5453123
    );

}





float noise(
    vec2 p
)
{

    vec2 i =
        floor(p);


    vec2 f =
        fract(p);



    float a =
        hash(i);


    float b =
        hash(i+vec2(1.0,0.0));


    float c =
        hash(i+vec2(0.0,1.0));


    float d =
        hash(i+vec2(1.0,1.0));



    vec2 u =
        f*f*
        (3.0-2.0*f);



    return mix(
        a,
        b,
        u.x
    )
    +
    (
        c-a
    )
    *
    u.y
    *
    (
        1.0-u.x
    )
    +
    (
        d-b
    )
    *
    u.x
    *
    u.y;

}





float fbm(
    vec2 p
)
{

    float value = 0.0;


    float amplitude = 0.5;



    for(int i=0;i<5;i++)
    {

        value +=
            noise(p)
            *
            amplitude;


        p *= 2.0;


        amplitude *= 0.5;

    }


    return value;

}



#endif