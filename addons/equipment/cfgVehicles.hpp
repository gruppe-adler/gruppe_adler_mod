class CfgVehicles
{
	class I_G_Story_Protagonist_F;
	
	class B_Kitbag_rgr;
	class B_Messenger_Coyote_F;
	class B_Messenger_Black_F;
	class B_Messenger_Olive_F;
	class B_Messenger_IDAP_F;
	
	
	class ga_soldier_u_i_pmc_rgr_1: I_G_Story_Protagonist_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "ga_u_i_pmc_rgr_1";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\equipment\data\uniforms\pmc\ga_u_i_pmc_rgr_1.paa"
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
		displayName = "Kitbag (Black, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_black_medic.paa"
		};
	};
	
	class ga_kitbag_tan_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Tan, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_tan_medic.paa"
		};
	};
	
	class ga_kitbag_sgg_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Sage, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_sgg_medic.paa"
		};
	};
	
	class ga_kitbag_rgr_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Green, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_rgr_medic.paa"
		};
	};
	
	class ga_kitbag_cbr_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Coyote, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\equipment\data\kitbag\ga_kitbag_cbr_medic.paa"
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
