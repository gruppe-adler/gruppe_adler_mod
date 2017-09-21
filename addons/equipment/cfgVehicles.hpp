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
	class rhsusf_assault_eagleaiii_ocp;

	class ga_kitbag_lite_black: rhsusf_assault_eagleaiii_ocp
	{
		scope = 2;
		author = "Synch";
		displayName = "Eagle A-III (Black)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\eagle\ga_eagle_black.paa"
		};
	};

	class ga_kitbag_lite_black_medic: rhsusf_assault_eagleaiii_ocp
	{
		scope = 2;
		author = "Synch";
		displayName = "Eagle A-III (Black / Medic)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\eagle\ga_eagle_black_medic.paa"
		};
	};

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
		displayName = "Kitbag (Black / Medic)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_black_medic.paa"
		};
	};
};
