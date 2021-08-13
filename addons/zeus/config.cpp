#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"chris5790", "McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "ace_zeus"};
        VERSION_CONFIG;
        units[] = {
			QGVAR(moduleSupplyDrop),
			QGVAR(moduleDiagnostics),
			QGVAR(moduleToggleBFT),
			QGVAR(moduleReloadLoadout),
			QGVAR(moduleSetLoadouts),
			QGVAR(moduleMoveRespawn),
			QGVAR(moduleBlacklistHeadless),
			QGVAR(moduleAddPlayersToZeus)
		};
        weapons[] = {};
    };
};

class CfgFactionClasses {
	class GVAR(category) {
		displayName = "Gruppe Adler";
		priority = 2;
		side = 7;
	};
};

#include "UI.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
