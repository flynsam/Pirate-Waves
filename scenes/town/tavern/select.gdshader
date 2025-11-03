shader_type canvas_item;
render_mode unshaded, blend_add; // additively “lights” whatever is behind

uniform vec4 glow_color : source_color = vec4(1.0, 0.9, 0.5, 1.0); // warm gold
uniform float intensity : hint_range(0.0, 3.0) = 0.0;             // we’ll tween this
uniform float radius    : hint_range(0.0, 1.0) = 0.35;            // inner bright size
uniform float softness  : hint_range(0.0, 1.0) = 0.45;            // feather width
uniform float pulse_speed  : hint_range(0.0, 5.0) = 0.6;
uniform float pulse_amount : hint_range(0.0, 1.0) = 0.25;         // how much the pulse changes

void fragment() {
    // Radial falloff from center of the rect (0..1 in both axes)
    vec2 uv = UV;
    vec2 center = vec2(0.5, 0.5);
    float d = distance(uv, center);

    // Soft circle: 1 inside, feather to 0 toward edge
    float edge  = smoothstep(radius, radius + softness, d);
    float glow  = 1.0 - edge;

    // Gentle pulse (0..pulse_amount)
    float pulse = (sin(TIME * 6.28318 * pulse_speed) * 0.5 + 0.5) * pulse_amount;

    // Final brightness
    float b = max(0.0, glow) * (intensity + pulse);

    COLOR = vec4(glow_color.rgb * b, glow_color.a * b);
}
