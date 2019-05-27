/*
    @Authors
        Christian 'chris5790' Klemm
    @Project
        Gruppe Adler Mod
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (hasInterface) then {
    GVAR(DiagnosticsSettings) = [false,false,false,false,false,false];
};

if (isServer) then {
    GVAR(usersPlayerFPS) = [];
    GVAR(usersObjectLocality) = [];
};

ADDON = true;
