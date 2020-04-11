#include "script_component.hpp"

private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _type = if ((faction _x) != "CIV_F") then {
        [_x] call FUNC(vanillaMilitaryDefactionizer);
    } else {
        [_x] call FUNC(vanillaCivDefactionizer);
    };

    private _index = _types pushBackUnique _type;
    _index != -1
};

GVAR(variables) = [_units, _types];

//Create Gui to get loadout name and medic equip
[] call FUNC(createGUI);

