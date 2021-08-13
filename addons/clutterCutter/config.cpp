#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"Raimo", "Fusselwurm"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "ace_interact_menu"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgVehicles.hpp"
