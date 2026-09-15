#ifndef AETHERIS_MATERIAL
#define AETHERIS_MATERIAL


// ===================================
// Aetheris Material Data
// ===================================



struct AER_Surface
{

    vec3 albedo;


    float metallic;


    float roughness;


    float emission;

};





AER_Surface AER_DefaultSurface(
    vec3 color
)
{

    AER_Surface s;


    s.albedo =
        color;


    s.metallic =
        0.0;


    s.roughness =
        0.85;


    s.emission =
        0.0;


    return s;

}



#endif