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
	class B_Messenger_Coyote_F;
	class B_Messenger_Black_F;
	class B_Messenger_Olive_F;
	class B_Messenger_IDAP_F;

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
	
	class ga_dlc_low_messenger_coyote_medic: B_Messenger_Coyote_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Coyote, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\messenger\ga_dlc_low_messenger_coyote_medic.paa"
		};
	};
	class ga_dlc_low_messenger_black_medic: B_Messenger_Black_F
	{
		scope = 2;
		author = "Synch";
	displayName = "Messenger Bag (Black, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\messenger\ga_dlc_low_messenger_black_medic.paa"
		};
	};
	class ga_dlc_low_messenger_olive_medic: B_Messenger_Olive_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Olive, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\messenger\ga_dlc_low_messenger_olive_medic.paa"
		};
	};
	
	
	class ga_dlc_low_messenger_medic: B_Messenger_IDAP_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\messenger\ga_dlc_low_messenger_medic.paa"
		};
	};
	
	
};
