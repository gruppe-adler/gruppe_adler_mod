#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_grad_Author";
        name = QUOTE(ADDON);
        url = "$STR_grad_URL";
        requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_common"};
		units[] = {};
		weapons[] = {};
        VERSION_CONFIG;
        authors[] = {
			"salbei <salbei@gruppe-adler.de>"
		};
	};
};

#include <CfgEventHandlers.hpp>
#include <CfgVehicles.hpp>
