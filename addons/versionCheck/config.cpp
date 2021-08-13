#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "ace_common", "grad_mod_ui"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\dialog.hpp"
