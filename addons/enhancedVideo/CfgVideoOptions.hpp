class CfgVideoOptions
{
	class Visibility
	{
		minValue=5;
		maxValue=40000;
	};
	class ObjectsVisibility
	{
		minValue=5;
		maxValue=30000;
	};
	class ShadowsVisibility
	{
		minValue=5;
		maxValue=3000;
	};
	class Particles
	{
		class High
		{
			text="Ultra+";
			particlesSoftLimit=16000;
			particlesHardLimit=18000;
			smokeGenMinDist=400;
			smokeGenMaxDist=1600;
			smokeSizeCoef=2.5999999;
			smokeIntervalCoef=4;
			smokeZoomCoef=1.42857;
			highQualityShader=1;
			numFullSizeParticles=120;
		};
	};
	class DynamicLights
	{
		class Extreme
		{
			text="Ultra+";
			value=32;
		};
	};
	class PiP
	{
		class VeryHigh2
		{
			text="Super";
			value=4000;
		};
	};
	class TextureQuality
	{
		class VeryLower2
		{
			text="Super low";
			mipBias=13;
			vramNeeded=0;
		};
		class VeryHigh2
		{
			text="More Ultra";
			mipBias=-1;
			vramNeeded=796;
		};
	};
	class ObjectsQuality
	{
		class VeryLow2
		{
			text="Lowest";
			value=100000;
		};
		class VeryHigh2
		{
			text="Ultra+";
			value=2600000;
		};
	};
	class CloudQuality
	{
		class Extreme
		{
			text="Heavenly";
			value=256;
		};
	};
	class WaterSSReflectionsQuality
	{
		class High2
		{
			text="Splendid";
			value=1.5;
		};
	};
	class ShadowQuality
	{
		class VeryHigh2
		{
			text="Super";
			shadowType=2;
			textureSize=4096;
			shaderQuality=3;
			cascadeLayers=8;
		};
	};
	class PPBloom
	{
		minValue=0;
		maxValue=3;
	};
	class PPDOF
	{
		minValue=0;
		maxValue=5;
	};
	class PPRotBlur
	{
		minValue=0;
		maxValue=2;
	};
	class PPRadialBlur
	{
		minValue=0;
		maxValue=2;
	};
	class PPSharpen
	{
		minValue=0;
		maxValue=4;
	};
	class PPBrightness
	{
		minValue=0;
		maxValue=2;
	};
	class PPContrast
	{
		minValue=0;
		maxValue=2;
	};
	class PPSaturation
	{
		minValue=0;
		maxValue=2;
	};
	class DefaultSettings;
	class OverallSettings
	{
		class VeryHigh2: DefaultSettings
		{
			text="EVS Ultra";
			visibility=20000;
			objectVisibility=12000;
			shadowVisibility=500;
			hdr="Normal";
			ppaa="SMAAVeryHigh";
			ppaaAlternative="SMAAVeryHigh";
			particles="High";
			dynamicLights="Extreme";
			anisotropicFiltering="VeryHigh";
			pip="VeryHigh2";
			textureQuality="VeryHigh2";
			objectsQuality="VeryHigh2";
			terrainQuality="VeryHigh";
			cloudQuality="Extreme";
			waterSSReflectionsQuality="High2";
			shadowQuality="VeryHigh2";
			atocQuality="Disabled";
			ppSSAOQuality="HBAOPlusStrong";
			ppSSAOQualityAlternative="HDAOHigh";
			ppCausticsQuality="Enabled";
			ppBloom=0.2;
			ppDOF=0.30000001;
			ppRotBlur=0;
			ppRadialBlur=0;
			ppSharpen=0.1;
			postProcessQuality=8;
			multiSampleCount=4;
		};
	};
};