#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_zeus"};
		units[] = {
			QGVAR(moduleSupplyDrop),
			QGVAR(moduleDiagnostics),
			QGVAR(moduleToggleBFT),
			QGVAR(moduleReloadLoadout),
			QGVAR(moduleSetLoadouts),
			QGVAR(moduleMoveRespawn),
			QGVAR(moduleBlacklistHeadless),
			QGVAR(moduleFillBox),
			QGVAR(moduleChairCircle),
			QGVAR(moduleAddPlayersToZeus)
		};
		weapons[] = {};
		VERSION_CONFIG;
        authors[] = {
			"chris5790",
			"McDiod",
			"Salbei",
			"nomisum"
		};
	};
};

class CfgFactionClasses {
	class GVAR(Grad) {
		displayName = "Gruppe Adler";
		priority = 2;
		side = 7;
	};
};

#include "UI.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
