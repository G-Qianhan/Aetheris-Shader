#ifndef AETHERIS_UNIFORMS
#define AETHERIS_UNIFORMS


// ===================================
// Aetheris Shader
// Global Uniform Interface
// ===================================



// ----------
// Buffers
// ----------

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;

uniform sampler2D depthtex0;



// ----------
// Shadow
// ----------

uniform sampler2D shadowtex0;


uniform mat4 shadowModelView;
uniform mat4 shadowProjection;



// ----------
// Camera
// ----------

uniform mat4 gbufferProjection;
uniform mat4 gbufferProjectionInverse;


uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;



// ----------
// Screen
// ----------

uniform vec2 viewSize;



// ----------
// Time
// ----------

uniform float frameTimeCounter;



// ----------
// World
// ----------

uniform vec3 sunPosition;
uniform vec3 moonPosition;



#endif