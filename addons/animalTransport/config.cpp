#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredAddons[] = {
			"grad_main",
			"ace_dragging",
			"a3_animals_f_beta_sheep",
			"rhs_c_trucks",
			"rhs_c_zil131"
		};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
		authors[] = {"Fusselwurm"};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
