#ifndef AETHERIS_COMMON
#define AETHERIS_COMMON


// ===================================
// Aetheris Shader
// Common Functions
// ===================================



#define PI 3.14159265359



// -----------------------------
// Clamp 0-1
// -----------------------------

float saturate(float x)
{
    return clamp(x,0.0,1.0);
}


vec3 saturate(vec3 x)
{
    return clamp(x,0.0,1.0);
}



// -----------------------------
// Luminance
// -----------------------------

float luminance(vec3 color)
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



// -----------------------------
// Gamma
// -----------------------------

vec3 linearToSRGB(vec3 color)
{
    return pow(
        color,
        vec3(
            1.0/2.2
        )
    );
}



vec3 sRGBToLinear(vec3 color)
{
    return pow(
        color,
        vec3(
            2.2
        )
    );
}



// -----------------------------
// Safe normalize
// -----------------------------

vec3 safeNormalize(vec3 v)
{

    float len =
        length(v);


    if(len < 0.0001)
    {
        return vec3(0.0,1.0,0.0);
    }


    return v / len;

}



#endif