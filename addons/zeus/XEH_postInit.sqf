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

if (isServer) then {
    {
        _x addCuratorPoints 1;
    } forEach allCurators;
};
