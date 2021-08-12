#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_GRAD_MOD_AUTHOR";
        name = QUOTE(ADDON);
        url = "$STR_GRAD_MOD_URL";
        requiredVersion = 1.0;
        requiredAddons[] = {"grad_main", "ace_interact_menu"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
        authors[] = {"Raimo", "Fusselwurm"};
    };
};

#include "CfgVehicles.hpp"
