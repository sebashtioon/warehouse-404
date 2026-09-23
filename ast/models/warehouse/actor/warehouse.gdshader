shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_burley, specular_schlick_ggx;

// Uniforms for the Inspector
uniform sampler2D albedo_texture : source_color;
uniform vec2 uv_scale = vec2(1.0, 1.0);
uniform vec2 uv_offset = vec2(0.0, 0.0);
uniform float rotation_degrees = 0.0;
uniform vec2 rotation_pivot = vec2(0.5);

// Helper function to scale, offset, and rotate UVs
vec2 transform_uv(vec2 uv) {
    // 1. Apply Scale
    uv *= uv_scale;
    
    // 2. Apply Rotation around a pivot point
    float rad = radians(rotation_degrees);
    float s = sin(rad);
    float c = cos(rad);
    uv -= rotation_pivot;
    uv = mat2(vec2(c, -s), vec2(s, c)) * uv;
    uv += rotation_pivot;
    
    // 3. Apply Offset
    uv += uv_offset;
    
    return uv;
}

void fragment() {
    // Transform the built-in UV coordinates
    vec2 transformed_uv = transform_uv(UV);
    
    // Sample the texture using the modified UVs
    ALBEDO = texture(albedo_texture, transformed_uv).rgb;
}
