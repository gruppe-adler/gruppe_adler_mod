#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredAddons[] = {
			"grad_main"
		};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
		authors[] = {"Fusselwurm"};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
