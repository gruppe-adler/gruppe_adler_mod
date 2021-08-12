#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_GRAD_MOD_AUTHOR";
		name = QUOTE(ADDON);
		url = "$STR_GRAD_MOD_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        	authors[] = {"McDiod"};
	};
};

#include "cfgNotifications.hpp"
#include "cfgEventhandlers.hpp"
#include "cfgFunctions.hpp"
#include "ui\dialog.hpp"
