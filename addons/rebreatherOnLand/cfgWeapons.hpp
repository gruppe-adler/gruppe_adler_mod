class CfgWeapons {
	class Default;
	class ItemCore;
	class InventoryItem_Base_F;
	class VestItem;
	class Vest_Camo_Base;
	class V_RebreatherB: Vest_Camo_Base {
		class ItemInfo;
	};

	class V_GA_OxygenTank_Blk: V_RebreatherB {
		author = "McDiod";
		displayName = "Oxygen Tank (Black)";
		hiddenSelections[] = {"camo","hide","unhide","unhide2"};
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"};
		hiddenUnderwaterSelections[] = {};
		shownUnderwaterSelections[] = {};
		hiddenUnderwaterSelectionsTextures[] = {};

		class ItemInfo: ItemInfo {
			author = "McDiod";
			containerClass = "Supply5";
			hiddenSelections[] = {"camo","hide","unhide","unhide2"};
			hiddenUnderwaterSelections[] = {};
			hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"};
			hiddenUnderwaterSelectionsTextures[] = {};
			shownUnderwaterSelections[] = {};
		};
	};
	class V_GA_OxygenTank_Oli: V_GA_OxygenTank_Blk {
		displayName = "Oxygen Tank (Olive)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherRU_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_rus_co.paa","\A3\characters_f\common\data\diver_equip_rus_co.paa","\A3\characters_f\data\visors_ca.paa"};
	};

	class V_GA_OxygenTank_Rgr: V_GA_OxygenTank_Blk {
		displayName = "Oxygen Tank (Green)";
		picture = "\A3\characters_f\Data\UI\icon_V_RebreatherIR_CA.paa";
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_iran_co.paa","\A3\characters_f\common\data\diver_equip_iran_co.paa","\A3\characters_f\data\visors_ca.paa"};
	};

	class V_GA_OxygenTank_Blk_nomask: V_GA_OxygenTank_Blk {
		scope = 1;
		scopeCurator = 0;
		scopeArsenal = 0;

		displayName = "Oxygen Tank (no mask)";

		hiddenSelections[] = {"camo","hide","unhide","unhide2"};
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa"};

		class ItemInfo: ItemInfo {
			hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa"};
		};
	};

	class V_GA_OxygenTank_Oli_nomask: V_GA_OxygenTank_Blk_nomask {
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_rus_co.paa"};
	};

	class V_GA_OxygenTank_Rgr_nomask: V_GA_OxygenTank_Blk_nomask {
		hiddenSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_iran_co.paa"};
	};
};
