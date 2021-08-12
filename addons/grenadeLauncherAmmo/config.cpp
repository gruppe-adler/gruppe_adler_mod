#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_GRAD_MOD_AUTHOR";
        name = QUOTE(ADDON);
        url = "$STR_GRAD_MOD_URL";
        requiredVersion = 1.0;
        requiredAddons[] = {"grad_main", "A3_Data_F", "A3_Weapons_F"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
        authors[] = {
            "Fusselwurm <fusselwurm@gmail.com>",
            "Willard"
        };
    };
};

#include "cfgAmmo.hpp"
