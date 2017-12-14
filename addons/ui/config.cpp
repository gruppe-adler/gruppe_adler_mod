#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(COMPONENT);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","A3_ui_f"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {
			"McDiod"
		};
	};
};

#include "cfgFunctions.hpp"
#include "dialog\directConnect.hpp"
