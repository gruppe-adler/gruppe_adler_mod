#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(component);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"ace_medical","grad_main"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"DerZade [A]","Willard"};
	};
};

#include "CfgFunctions.hpp"
#include "ACE_Treatments.hpp"
#include "cfgEventHandlers.hpp"
