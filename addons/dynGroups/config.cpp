#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(component);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Ui_F","ace_common","po_main","cba_common"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {"McDiod"};
	};
};

#include "cfgScriptPaths.hpp"
#include "cfgFunctions.hpp"
#include "cfgUnitInsignia.hpp"
#include "dialogs.hpp"
