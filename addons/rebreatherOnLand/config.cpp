#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(component);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "cfgFunctions.hpp"
#include "titles\RscTitles.hpp"
#include "cfgWeapons.hpp"
