#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main", "task_force_radio","A3_weapons_f"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"Synch"};
	};
};

#include "cfgVehicles.hpp"
#include "cfgUnitInsignia.hpp"
#include "cfgWeapons.hpp"