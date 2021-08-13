#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"Salbei"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};


#include "CfgEventHandlers.hpp"
