package hrt.shader;

class MaskColorAlpha extends hxsl.Shader {
	static var SRC = {
		@const var MULTIPLY : Bool;
		@param var color : Vec4;
		@param var mask : Sampler2D;
		@param var UVOffset : Vec2;
		@param var UVScale : Vec2 = vec2(1.0,1.0);
		@param var alpha : Float = 1.0;
		var pixelColor : Vec4;

		var calculatedUV : Vec2;

		function fragment() {

			var texColor = mask.get(mod((calculatedUV + UVOffset) * UVScale, vec2(1.0,1.0)));
			var maskAlpha = texColor.r;
			if (MULTIPLY) {
				pixelColor.rgb = mix(pixelColor.rgb, pixelColor.rgb*color.rgb, maskAlpha * alpha);
			}
			else
			{
				pixelColor.rgb = mix(pixelColor.rgb, color.rgb, maskAlpha * alpha);
			}
		}
	};
}