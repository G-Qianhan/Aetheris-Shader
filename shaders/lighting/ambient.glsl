/*
    Aetheris Shader
    Ambient Lighting
*/


vec3 AetherisAmbient(
    vec3 color,
    float strength
)
{

    return color * strength;

}