#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"McDiod"};
        requiredVersion = 1.0;
        requiredAddons[] = {"cba_main", "ace_main"};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};