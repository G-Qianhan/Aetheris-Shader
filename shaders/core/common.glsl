#ifndef AETHERIS_COMMON
#define AETHERIS_COMMON


#define AER_PI 3.14159265359



float AER_Saturate(
    float x
)
{
    return clamp(
        x,
        0.0,
        1.0
    );
}



vec3 AER_Saturate(
    vec3 x
)
{
    return clamp(
        x,
        0.0,
        1.0
    );
}




float AER_Luminance(
    vec3 color
)
{
    return dot(
        color,
        vec3(
            0.2126,
            0.7152,
            0.0722
        )
    );
}





vec3 AER_LinearToSRGB(
    vec3 color
)
{
    return pow(
        color,
        vec3(
            1.0 / 2.2
        )
    );
}





vec3 AER_SRGBToLinear(
    vec3 color
)
{
    return pow(
        color,
        vec3(
            2.2
        )
    );
}





vec3 AER_SafeNormalize(
    vec3 v
)
{

    float len =
        length(v);


    if(len < 0.00001)
    {
        return vec3(
            0.0,
            1.0,
            0.0
        );
    }


    return v / len;

}



#endif