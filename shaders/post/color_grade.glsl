#ifndef AETHERIS_COLOR_GRADE
#define AETHERIS_COLOR_GRADE



// ===================================
// Aetheris Cinematic Color
// ===================================


vec3 AER_ColorGrade(
    vec3 color
)
{


    // slightly cinematic contrast

    color =
        pow(
            color,
            vec3(
                0.95
            )
        );



    return color;

}



#endif