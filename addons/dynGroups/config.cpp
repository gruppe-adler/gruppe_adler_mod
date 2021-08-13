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

#include "cfgScriptPaths.hpp"
#include "cfgFunctions.hpp"
#include "cfgUnitInsignia.hpp"
#include "dialogs.hpp"
