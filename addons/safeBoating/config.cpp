#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        author = QUOTE(AUTHOR);
        url = QUOTE(URL);
        authors[] = {"Fusselwurm"};
        requiredVersion = 1.0;
        requiredAddons[] = {QMAINPATCH};
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgEventHandlers.hpp"

class CfgVehicles {
	class Boat_Transport_02_base_F;
	class Rubber_duck_base_F: Boat_Transport_02_base_F {
		rudderForceCoef = 0.3;
	};
};
