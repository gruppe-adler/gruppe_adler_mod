#include "script_component.hpp"

class CfgPatches
{
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 0.1;
		requiredAddons[] = {"grad_main","ace_medical"};
		units[] = {"GRAD_alkItem"};
		weapons[] = {"GRAD_ALK"};
		VERSION_CONFIG;
        authors[] = {"DerZade [A]"};
	};
};

#include "cfgEventHandlers.hpp"
#include "ACE_Treatments.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
