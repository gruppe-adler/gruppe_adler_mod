class CfgVehicles
{
	class B_Soldier_F;
	class B_Soldier_lite_F;
	class B_soldier_AR_F;
	class B_GEN_Soldier_F;
	class I_E_Soldier_lite_F;

	class B_Kitbag_rgr;
	class B_Messenger_Coyote_F;
	class B_Messenger_Black_F;
	class B_Messenger_Olive_F;
	class B_Messenger_IDAP_F;
	
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START


	class grad_soldier_combatUniform_usArmy_OCP: B_Soldier_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_usArmy_OCP";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_YesFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\USArmy\GRAD_U_CombatUniform_USArmy_OCP.paa"
        };
	};

	class grad_soldier_combatUniform_usArmy_OCP_S: B_Soldier_lite_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_usArmy_OCP_S";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_YesFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\USArmy\GRAD_U_CombatUniform_USArmy_OCP_v2.paa" //TEMP V2
        };
		
	};

	class grad_soldier_combatUniform_usArmy_OCP_T: B_soldier_AR_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_usArmy_OCP_T";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_YesFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\USArmy\GRAD_U_CombatUniform_USArmy_OCP.paa"
        };
		
	};



class grad_soldier_combatUniform_noFlag_Khaki: B_Soldier_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_noFlag_Khaki";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_noFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa"
        };
	};

	class grad_soldier_combatUniform_noFlag_Khaki_S: B_Soldier_lite_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_noFlag_Khaki_S";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_noFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa" //TEMP V2
        };
		
	};

	class grad_soldier_combatUniform_noFlag_Khaki_T: B_soldier_AR_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatUniform_noFlag_Khaki_T";
		hiddenSelectionsMaterials[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\GRAD_U_CombatUniform_noFlag.rvmat"
        };
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa"
        };
		
	};




// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START




	class grad_soldier_combatCasual_khaki_blue: B_GEN_Soldier_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatCasual_khaki_blue";
		hiddenSelectionsTextures[]=
        {
            "x\grad\addons\kit\data\uniforms\combatCasual\grad_u_combatCasual_shirt_blue.paa","x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa" //2_1 & 2_2 & 2_3
        };
		
	};

	



// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START

class grad_soldier_combatFatigues_khaki: I_E_Soldier_lite_F
	{
		author = "Synch";
		scope = 1;                          // 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).		
		uniformClass = "grad_u_combatFatigues_khaki";
		// hiddenSelectionsTextures[]=
        // {
        //     "x\grad\addons\kit\data\uniforms\combatCasual\grad_u_combatCasual_shirt_blue.paa","x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa","x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa" //2_1 & 2_2 & 2_3
        // };
		
	};




	class grad_kitbag_black: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Black)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_black.paa"
		};
	};

	class grad_kitbag_black_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Black, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_black_medic.paa"
		};
	};
	
	class grad_kitbag_tan_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Tan, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_tan_medic.paa"
		};
	};
	
	class grad_kitbag_sgg_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Sage, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_sgg_medic.paa"
		};
	};
	
	class grad_kitbag_rgr_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Green, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_rgr_medic.paa"
		};
	};
	
	class grad_kitbag_cbr_medic: B_Kitbag_rgr
	{
		scope = 2;
		author = "Synch";
		displayName = "Kitbag (Coyote, Medical)";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\kitbag\grad_kitbag_cbr_medic.paa"
		};
	};
	
	class grad_dlc_low_messenger_coyote_medic: B_Messenger_Coyote_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Coyote, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\messenger\grad_dlc_low_messenger_coyote_medic.paa"
		};
	};
	class grad_dlc_low_messenger_black_medic: B_Messenger_Black_F
	{
		scope = 2;
		author = "Synch";
	displayName = "Messenger Bag (Black, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\messenger\grad_dlc_low_messenger_black_medic.paa"
		};
	};
	class grad_dlc_low_messenger_olive_medic: B_Messenger_Olive_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Olive, Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\messenger\grad_dlc_low_messenger_olive_medic.paa"
		};
	};
	
	
	class grad_dlc_low_messenger_medic: B_Messenger_IDAP_F
	{
		scope = 2;
		author = "Synch";
		displayName = "Messenger Bag (Medical) [LoW DLC]";
		hiddenSelectionsTextures[] =
		{
			"x\grad\addons\kit\data\bags\messenger\grad_dlc_low_messenger_medic.paa"
		};
	};
	
	
};
