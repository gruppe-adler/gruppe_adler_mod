#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"nomisum"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "a3_data_f", "a3_weapons_f", "cba_jr"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

class asdg_SlotInfo;

class asdg_FrontSideRail: asdg_SlotInfo {

	class compatibleItems {
		acc_flashlight = 1;
	};
};

class CfgWeapons {
    
    class ItemCore;

    class InventoryItem_Base_F;
    class InventoryFlashLightItem_Base_F;

    class acc_flashlight
        {
            author = "nomisum";
            _generalMacro = "acc_flashlight";
            scope = 2;
            descriptionUse = "<t color='#9cf953'>Use: </t>Turn Flashlight ON/OFF";
            picture = "\A3\weapons_F\Data\UI\gear_accv_flashlight_CA.paa";
            model = "\A3\weapons_f\acc\accv_Flashlight_F";
            descriptionShort = "Weapon mounted light.";
            class ItemInfo: InventoryFlashLightItem_Base_F
            {
                mass = 4;
                class FlashLight
                {
                    color[] = {130, 160, 180};
                    ambient[] = {0.05, 0.1, 0.15};
                    intensity = 1350;
                    size = 1;
                    innerAngle = 5;
                    outerAngle = 45;
                    coneFadeCoef = 10;
                    position = "flash dir";
                    direction = "flash";
                    useFlare = 1;
                    flareSize = 4;
                    flareMaxDistance = 200;
                    dayLight = 1;
                    class Attenuation
                    {
                    	start = 0;
						constant = 0;
						linear = 0;
						quadratic = 0.1;
						/*
						hardLimitStart = 100;
						hardLimitEnd = 200;
						*/
                    };
                    scale[] = {0};
                    ACE_Flashlight_Colour = "white";
                    ACE_Flashlight_Beam = "\z\ace\addons\map\UI\Flashlight_beam_white_ca.paa";
                    ACE_Flashlight_Size = 2.75;
                    ACE_Flashlight_Sound = 1;
                };
            };
            inertia = 0.1;
            displayName = "GRAD Enhanced Flashlight";
        };
};

class CfgVehicles {
	
	/*extern*/ class Strategic;
	/*extern*/ class ReammoBox;
	/*extern*/ class WeaponHolder;
    /*extern*/ class Item_Base_F;

    class Item_acc_flashlight: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        author = "nomisum";
        editorCategory = "EdCat_WeaponAttachments";
        editorSubcategory = "EdSubcat_SideSlot";
        vehicleClass = "WeaponAccessories";

        class TransportItems {

            class acc_flashlight {
                name = "acc_flashlight";
                count = 1;
            };
        };

        displayName = "GRAD Enhanced Flashlight";
    };
};