#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","A3_Ui_F"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"
#include "gui\defines.hpp"
#include "gui\sendBoxBase.hpp"
#include "gui\interruptMenu.hpp"
