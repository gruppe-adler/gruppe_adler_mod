#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"Fusselwurm", "Willard"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "a3_data_f", "a3_weapons_f"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgAmmo.hpp"
