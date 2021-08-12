#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_GRAD_MOD_AUTHOR";
        name = QUOTE(ADDON);
        url = "$STR_GRAD_MOD_URL";
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"cba_main","ace_main"};
        VERSION_CONFIG;
        authors[] = {"McDiod"};
    };
};
