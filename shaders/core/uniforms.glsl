#ifndef AETHERIS_UNIFORMS
#define AETHERIS_UNIFORMS


// ===================================
// Aetheris Global Uniforms
// ===================================



// -----------------------------
// GBuffer textures
// -----------------------------

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D colortex3;

uniform sampler2D depthtex0;



// -----------------------------
// Shadow
// -----------------------------

uniform sampler2D shadowtex0;
uniform sampler2D shadowcolor0;


uniform mat4 shadowModelView;
uniform mat4 shadowProjection;



// -----------------------------
// Camera matrices
// -----------------------------


uniform mat4 gbufferModelView;

uniform mat4 gbufferModelViewInverse;


uniform mat4 gbufferProjection;

uniform mat4 gbufferProjectionInverse;



// -----------------------------
// Camera
// -----------------------------


uniform vec3 cameraPosition;


uniform vec2 viewSize;



// -----------------------------
// Time
// -----------------------------


uniform float frameTimeCounter;



// -----------------------------
// Sun
// -----------------------------


uniform vec3 sunPosition;



#endif