#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","A3_Ui_F","ace_common","cba_common", "ace_dragging"}; // TODO check all other classes we reference
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"Fusselwurm"};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
