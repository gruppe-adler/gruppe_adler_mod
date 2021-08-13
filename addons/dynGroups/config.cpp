#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "a3_ui_f"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgScriptPaths.hpp"
#include "CfgFunctions.hpp"
#include "CfgUnitInsignia.hpp"
#include "CfgEventHandlers.hpp"
#include "dialogs.hpp"
