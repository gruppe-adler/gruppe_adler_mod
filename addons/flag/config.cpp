#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main", "A3_Structures_F_Mil_Flags"};
		units[] = {""};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"DerZade [A]"};
	};
};

#include "cfgVehicles.hpp"
