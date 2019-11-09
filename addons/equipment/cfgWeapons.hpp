class CfgWeapons
{
	class Uniform_Base;
	//class U_I_G_Story_Protagonist_F;
	
	
	class U_I_G_Story_Protagonist_F: Uniform_Base
	{
		class ItemInfo;
	};

	class ga_u_i_pmc_rgr_1: U_I_G_Story_Protagonist_F
	{
		author = "Synch";
		displayName = "A Test (Green)";		
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\equipment\data\uniforms\pmc\ga_u_i_pmc_rgr_1.paa"
        };
		
		class ItemInfo: ItemInfo
        {
            uniformClass = "ga_soldier_u_i_pmc_rgr_1";
        };
	};
};
