/*
    Aetheris Exposure System
*/


vec3 AetherisExposure(vec3 color)
{

    float exposure = 1.15;


    color *= exposure;


    return color;

}