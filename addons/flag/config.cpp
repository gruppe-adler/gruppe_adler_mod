#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"DerZade"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH, "a3_structures_f_mil_flags"};
        VERSION_CONFIG;
        units[] = {
			QGVAR(gruppeAdlerWhite)
		};
        weapons[] = {};
    };
};

#include "CfgVehicles.hpp"
