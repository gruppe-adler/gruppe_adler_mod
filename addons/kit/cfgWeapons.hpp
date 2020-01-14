class CfgWeapons
{
	class Uniform_Base;
	//class U_I_G_Story_Protagonist_F;
	
	
	class U_B_CombatUniform_mcam: Uniform_Base //Combat Uniform
	{
		class ItemInfo;
	};
	class U_B_GEN_Soldier_F: Uniform_Base //Combat Casual
	{
		class ItemInfo;
	}
	class U_I_E_Uniform_01_tanktop_F: Uniform_Base //Combat Fatigues (Tank Top, Gloves)
	{
		class ItemInfo;
	}

	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START
	// COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START COMBAT UNIFORM START

	class grad_u_combatUniform_usArmy_OCP: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_S: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP, Rolled-up) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_S";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_T: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP, Tee) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_T";
        };
	};

class grad_u_combatUniform_noFlag_Khaki: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Khaki)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Khaki";
        };
	};

	class grad_u_combatUniform_noFlag_Khaki_S: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Khaki, Rolled-up)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Khaki_S";
        };
	};

	class grad_u_combatUniform_noFlag_Khaki_T: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Khaki, Tee)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Khaki_T";
        };
	};



// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START




	class grad_u_combatCasual_khaki_blue: U_B_GEN_Soldier_F
	{
		author = "Synch";
		displayName = "Combat Casual (Khaki, Blue)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatCasual_khaki_blue";
        };
	};




// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START


class grad_u_combatFatigues_khaki: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		displayName = "Combat Fatigues (Khaki)";		
		hiddenSelections[] = {"camo1","camo2","camo3","insignia"};
		//hiddenSelectionsTextures[] = {"x\grad\addons\kit\data\uniforms\combatCasual\grad_u_combatCasual_shirt_blue.paa","x\grad\addons\kit\data\uniforms\combatUniform\noFlag\GRAD_U_CombatUniform_noFlag_Khaki.paa","\A3\Characters_F_Enoch\Uniforms\Data\I_E_Soldier_01_gloves_black_CO.paa"};
		hiddenSelectionsTextures[] = {"LDF_Desert_Uniforms\Data\ACM_T_U_Tanktop.paa","LDF_Desert_Uniforms\Data\ACM_T_U_Soldier1.paa","\A3\Characters_F_Enoch\Uniforms\Data\I_E_Soldier_01_gloves_black_CO.paa"};
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_khaki";
        };
	};


	// //CARRIER
	// class ItemCore;
	// class InventoryItem_Base_F;
	// class VestItem;
	// class Vest_Camo_Base;
	// class V_PlateCarrier1_blk: Vest_Camo_Base
	// {
	// 	class ItemInfo;
	// };

	// class grad_v_carrierLight_OCP: V_PlateCarrier1_blk
	// {
	// 	author = "Synch";
	// 	displayName = "Carrier Light (OCP)";
	// 	hiddenSelectionsTextures[] = {"x\grad\addons\kit\data\vests\grad_V_CarrierLight_OCP.paa"};
	// };





};
