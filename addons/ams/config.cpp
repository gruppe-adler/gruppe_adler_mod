#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(component);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_medical"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"DerZade [A]"};
	};
};

#include "ACE_Treatments.hpp"
#include "CfgFunctions.hpp"
