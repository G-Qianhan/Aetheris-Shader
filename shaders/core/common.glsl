#ifndef AETHERIS_COMMON
#define AETHERIS_COMMON


// ===================================
// Aetheris Common Library
// ===================================



#define AER_PI 3.14159265359
#define AER_EPSILON 0.00001



// -----------------------------------
// Clamp
// -----------------------------------

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




// -----------------------------------
// Luminance
// -----------------------------------

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





// -----------------------------------
// Normalize
// -----------------------------------

vec3 AER_Normalize(
    vec3 value
)
{

    float len =
        length(value);



    if(
        len < AER_EPSILON
    )
    {
        return vec3(
            0.0,
            1.0,
            0.0
        );
    }


    return value / len;

}





// -----------------------------------
// Gamma
// -----------------------------------

vec3 AER_ToLinear(
    vec3 color
)
{
    return pow(
        color,
        vec3(2.2)
    );
}





vec3 AER_ToSRGB(
    vec3 color
)
{
    return pow(
        color,
        vec3(1.0 / 2.2)
    );
}





#endif