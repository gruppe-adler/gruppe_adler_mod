#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"Fusselwurm"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "ace_spectator"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"

class ACE_spectator_display {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};
class ACE_spectator_interface {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};
