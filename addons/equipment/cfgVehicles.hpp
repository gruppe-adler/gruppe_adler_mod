enum {
	OrdinalEnum = 2,
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};


class CfgVehicles
{
	class B_Kitbag_rgr;

	class ga_kitbag_black: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Black)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_black.paa"
		};
	};

	class ga_kitbag_black_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Black, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_black_medic.paa"
		};
	};
};
