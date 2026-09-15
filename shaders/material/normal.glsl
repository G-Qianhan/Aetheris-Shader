#ifndef AETHERIS_NORMAL
#define AETHERIS_NORMAL


#include "/core/common.glsl"


// ===================================
// Normal Utilities
// ===================================



vec3 AER_ReconstructNormal(
    vec3 encoded
)
{

    return AER_Normalize(
        encoded *
        2.0
        -
        1.0
    );

}



#endif