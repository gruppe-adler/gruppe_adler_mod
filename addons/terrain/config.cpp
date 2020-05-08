#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_grad_Author";
        name = QUOTE(ADDON);
        url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Map_Data"};
        VERSION_CONFIG;
        authors[] = {
			"Fusselwurm <fusselwurm@gmail.com>"
		};
	};
};

class CfgWorlds {
    class DefaultWorld;
    class CAWorld: DefaultWorld {
        fogBeta0Max = 0.001;
    };
    class tem_vinjesvingenc: CAWorld {
        fogBeta0Max = 0.5;
    };
};
