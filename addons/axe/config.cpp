#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_interaction"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
