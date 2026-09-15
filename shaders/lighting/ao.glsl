/*
    Aetheris Ambient Occlusion

    Screen Space AO prototype
*/


float AetherisAO(
    float depth
)
{

    float ao =
        1.0 - depth;


    return clamp(
        ao,
        0.0,
        1.0
    );

}