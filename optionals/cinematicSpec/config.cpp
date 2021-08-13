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

#include "CfgEventHandlers.hpp"

class ACE_spectator_display {
	onKeyDown = QUOTE(_this call FUNC(chainHandlers));
};
class ACE_spectator_interface {
	onKeyDown = QUOTE(_this call FUNC(chainHandlers));
};
