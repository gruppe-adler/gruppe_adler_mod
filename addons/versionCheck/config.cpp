#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_common"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"
#include "ui\dialog.hpp"

class CfgVehicles {
	class Boat_Transport_02_base_F;
	class Rubber_duck_base_F: Boat_Transport_02_base_F {
		rudderForceCoef = 1;
	};
};
