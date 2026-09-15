#ifndef AETHERIS_MATH
#define AETHERIS_MATH


// ===================================
// Aetheris Math Library
// ===================================



float square(float x)
{
    return x*x;
}



vec3 square(vec3 x)
{
    return x*x;
}



float remap(
    float value,
    float min1,
    float max1,
    float min2,
    float max2
)
{
    return min2 +
    (
        value-min1
    )
    *
    (
        max2-min2
    )
    /
    (
        max1-min1
    );
}



float smoothstep01(float x)
{
    return x*x*(3.0-2.0*x);
}



#endif