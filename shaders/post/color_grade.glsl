vec3 AetherisColorGrade(vec3 color)
{

    // Exposure
    color *= AE_EXPOSURE;


    // Contrast
    color =
        (color - 0.5)
        * AE_CONTRAST
        + 0.5;


    return color;
}