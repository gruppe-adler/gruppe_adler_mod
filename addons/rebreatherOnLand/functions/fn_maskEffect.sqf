#include "..\defines.hpp"

params [["_on",true]];

if (_on) then {
    if (!grad_rebreatherOnLand_maskEffect) then {
        grad_rebreatherOnLand_maskEffect = true;
        MASKLAYER cutRsc ["ga_rebreatherOnLand_RscMask","PLAIN"];
    };
} else {
    if (grad_rebreatherOnLand_maskEffect) then {
        grad_rebreatherOnLand_maskEffect = false;
        MASKLAYER cutRsc ["ga_rebreatherOnLand_RscDefault","PLAIN"];
    };
};
