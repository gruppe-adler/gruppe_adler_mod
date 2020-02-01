class CfgWeapons
{
	class Uniform_Base;
	class UniformItem;
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
		scope = 1; //WIP
		displayName = "Combat Uniform (OCP) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_S: U_B_CombatUniform_mcam
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Uniform (OCP, Rolled-up) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_S";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_T: U_B_CombatUniform_mcam
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Uniform (OCP, Tee) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_T";
        };
	};

// KHAKI KHAKI KHAKI KHAKI KHAKI
// KHAKI KHAKI KHAKI KHAKI KHAKI

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


// RANGER RANGER RANGER RANGER RANGER
// RANGER RANGER RANGER RANGER RANGER

class grad_u_combatUniform_noFlag_Ranger: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Ranger Green)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Ranger";
        };
	};

	class grad_u_combatUniform_noFlag_Ranger_S: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Ranger Green, Rolled-up)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Ranger_S";
        };
	};

	class grad_u_combatUniform_noFlag_Ranger_T: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (Ranger Green, Tee)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_noFlag_Ranger_T";
        };
	};



// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START
// COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START COMBAT CASUAL START




	class grad_u_combatCasual_khaki_grey: U_B_GEN_Soldier_F
	{
		author = "Synch";
		displayName = "Combat Casual (Khaki, Grey)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatCasual_khaki_grey";
        };
	};

// KHAKI WHITE KHAKI WHITE KHAKI WHITE KHAKI WHITE KHAKI WHITE
// KHAKI WHITE KHAKI WHITE KHAKI WHITE KHAKI WHITE KHAKI WHITE

class grad_u_combatCasual_khaki_white: U_B_GEN_Soldier_F
	{
		author = "Synch";
		displayName = "Combat Casual (Khaki, White)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatCasual_khaki_white";
        };
	};

// RANGER GREY RANGER GREY RANGER GREY RANGER GREY RANGER GREY	
// RANGER GREY RANGER GREY RANGER GREY RANGER GREY RANGER GREY	

class grad_u_combatCasual_ranger_grey: U_B_GEN_Soldier_F
	{
		author = "Synch";
		displayName = "Combat Casual (Ranger, Grey)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatCasual_ranger_grey";
        };
	};


// RANGER WHITE RANGER WHITE RANGER WHITE RANGER WHITE RANGER WHITE	
// RANGER WHITE RANGER WHITE RANGER WHITE RANGER WHITE RANGER WHITE	

class grad_u_combatCasual_ranger_white: U_B_GEN_Soldier_F
	{
		author = "Synch";
		displayName = "Combat Casual (Ranger, White)";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatCasual_ranger_white";
        };
	};

// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START
// COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START COMBAT FATIGUES START


class grad_u_combatFatigues_khaki_white: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Khaki, White)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_khaki_white";
        };
	};

// KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka
// KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka KHAKI Telnyashka

class grad_u_combatFatigues_khaki_telnyashka: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Khaki, Telnyashka)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_khaki_telnyashka";
        };
	};

// KHAKI BLACK KHAKI BLACK KHAKI BLACK KHAKI BLACK KHAKI BLACK
// KHAKI BLACK KHAKI BLACK KHAKI BLACK KHAKI BLACK KHAKI BLACK	

class grad_u_combatFatigues_khaki_black: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Khaki, Black)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_khaki_black";
        };
	};

// GREEN WHITE GREEN WHITE GREEN WHITE GREEN WHITE GREEN WHITE
// GREEN WHITE GREEN WHITE GREEN WHITE GREEN WHITE GREEN WHITE

class grad_u_combatFatigues_green_white: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Green, White)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_green_white";
        };
	};

//GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka 	
//GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka GREEN Telnyashka 

class grad_u_combatFatigues_green_telnyashka: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Green, Telnyashka)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_green_telnyashka";
        };
	};

//GREEN BLACK GREEN BLACK GREEN BLACK GREEN BLACK GREEN BLACK 
//GREEN BLACK GREEN BLACK GREEN BLACK GREEN BLACK GREEN BLACK 

class grad_u_combatFatigues_green_black: U_I_E_Uniform_01_tanktop_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Combat Fatigues (Green, Black)";		 
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatFatigues_green_black";
        };
	};

//CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK
//CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK
//CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK
//CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK
//CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK CARRIER BLOCK

	class ItemCore;
	class InventoryItem_Base_F;
	class VestItem;
	class Vest_Camo_Base;

	class V_CarrierRigKBT_01_Base_F;
	class V_CarrierRigKBT_01_light_Base_F;
	class V_PlateCarrier1_blk: Vest_Camo_Base
	{
		class ItemInfo;
	};

	class V_CarrierRigKBT_01_Olive_F: V_CarrierRigKBT_01_Base_F
	{
		class ItemInfo;
	};

	class V_CarrierRigKBT_01_light_Olive_F: V_CarrierRigKBT_01_light_Base_F
	{
		class ItemInfo;
	};
	
	


	class grad_v_carrierLight_OCP: V_PlateCarrier1_blk
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Carrier Light (OCP)";
		hiddenSelectionsTextures[] = {"x\grad\addons\kit\data\vests\grad_V_CarrierLight_OCP_co.paa"};
	};

	class grad_v_modularCarrier_light_black: V_CarrierRigKBT_01_light_Olive_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Modular Carrier Light (Black)";
		hiddenSelectionsTextures[] = {"x\grad\addons\kit\data\vests\modularCarrier\grad_v_modularCarrier_black_co.paa"};
	};

	class grad_v_modularCarrier_black: V_CarrierRigKBT_01_Olive_F
	{
		author = "Synch";
		scope = 1; //WIP
		displayName = "Modular Carrier (Black)";
		hiddenSelectionsTextures[] = {"x\grad\addons\kit\data\vests\modularCarrier\grad_v_modularCarrier_black_co.paa"};
	};



};
