#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		ACE_isOptional = 1;
		author = "$STR_grad_Author";
		authors[] = {"fusselwurm <fusselwurm@gmail.com>"};
		name = CSTRING(COMPONENT);
		requiredAddons[] = {"cba_main","ace_main"}; // LOP & RHS
		requiredVersion = 1.0;
		units[] = {};
		url = "$STR_grad_URL";
		VERSION_CONFIG;
		weapons[] = {};
	};
};

class CfgVehicles {
	class PO_LandRover_base: Car_F {
		enginePower = 161;
		peakTorque = 731;
	};
};
