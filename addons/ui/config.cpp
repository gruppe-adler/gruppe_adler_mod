#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_GRAD_MOD_AUTHOR";
		name = QUOTE(ADDON);
		url = "$STR_GRAD_MOD_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","A3_ui_f"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {
			"McDiod",
      "DerZade"
		};
	};
};

#include "cfgFunctions.hpp"
#include "cfgEventhandlers.hpp"
#include "dialog\directConnect.hpp"
