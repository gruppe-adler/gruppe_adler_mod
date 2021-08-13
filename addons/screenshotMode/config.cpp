#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"DerZade"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "cfgFunctions.hpp"
#include "cfgEventHandlers.hpp"
