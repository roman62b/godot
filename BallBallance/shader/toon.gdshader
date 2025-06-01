shader_type spatial;

uniform sampler2D color_ramp;

// Higher values are smaller width.
uniform float outline_width : hint_range(0.0, 10.0, 0.1) = 5.0;

uniform vec4 base_color : source_color = vec4(1.0);

float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0 )), amount);
}

void fragment()
{
	float basic_fresnel = fresnel(outline_width, NORMAL, VIEW);
	basic_fresnel = step(0.5, basic_fresnel); //0.5 magic number seems to give the most intuitive control
	ALBEDO = base_color.rgb - basic_fresnel;
}

void light() {
	float dotnl = dot(NORMAL, LIGHT);
	float sample_position = max((dotnl + 1.0) / 2.01, 0.01);
	vec4 ramp_light = texture(color_ramp, vec2(sample_position, 0.0));
	vec3 diffuse_light = ramp_light.rgb * clamp(LIGHT_COLOR * ATTENUATION, vec3(0,0,0), vec3(1,1,1));
	DIFFUSE_LIGHT = max(diffuse_light, DIFFUSE_LIGHT);
}