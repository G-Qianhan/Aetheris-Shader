/*
    Aetheris Shader
    Sunlight System
*/


vec3 AetherisSunLight(
    vec3 color,
    vec3 normal,
    vec3 lightDirection,
    vec3 lightColor
)
{

    float diffuse =
        max(
            dot(normal, lightDirection),
            0.0
        );


    return color
        * lightColor
        * diffuse;

}