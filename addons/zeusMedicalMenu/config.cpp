#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {
            GVAR(zeusMedicalMenu)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QMAINPATCH , "grad_zeus", "ace_medical_gui"};
        authors[] = { "Salbei" };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgUIGrids.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
