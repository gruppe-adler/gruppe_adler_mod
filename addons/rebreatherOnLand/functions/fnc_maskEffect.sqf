#include "script_component.hpp"

params [["_on",true]];

if (_on) then {
    if (!GVAR(maskEffect)) then {
        GVAR(maskEffect) = true;
        MASKLAYER cutRsc [QGVAR(Mask),"PLAIN"];
    };
} else {
    if (GVAR(maskEffect)) then {
        GVAR(maskEffect) = false;
        MASKLAYER cutRsc [QGVAR(Default),"PLAIN"];
    };
};
