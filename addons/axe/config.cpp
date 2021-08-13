#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "ace_interact_menu", "a3_structures_f"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
