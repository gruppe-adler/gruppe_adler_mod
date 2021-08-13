#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "cfgNotifications.hpp"
#include "cfgEventhandlers.hpp"
#include "cfgFunctions.hpp"
#include "ui\dialog.hpp"
