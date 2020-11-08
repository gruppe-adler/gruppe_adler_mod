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

class CfgVehicles {
	class Boat_Transport_02_base_F;
	class Rubber_duck_base_F: Boat_Transport_02_base_F {
		rudderForceCoef = 1;
	};
};
