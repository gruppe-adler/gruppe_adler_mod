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

#include "CfgEventHandlers.hpp"

#include "gui\defines.hpp"
#include "gui\sendBoxBase.hpp"
#include "gui\interruptMenu.hpp"
#include "gui\rscTitles.hpp"
