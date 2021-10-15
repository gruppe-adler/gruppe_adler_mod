#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"grad_main"};
        authors[] = { "Salbei"};
        VERSION_CONFIG;
    };
};

#include <CfgEventHandlers.hpp>
#include <Display3DEN.hpp>
#include "dialog\display.hpp"
