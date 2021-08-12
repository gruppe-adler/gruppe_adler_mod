#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_GRAD_MOD_AUTHOR";
		name = QUOTE(ADDON);
		url = "$STR_GRAD_MOD_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main", "A3_Structures_F_Mil_Flags"};
		units[] = {QGVAR(gruppeAdlerWhite)};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"DerZade [A]"};
	};
};

#include "cfgVehicles.hpp"
