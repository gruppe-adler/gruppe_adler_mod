#include "script_component.hpp"

private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _split = (typeOf _x) splitString "_";
    _split deleteAt 0;
    private _index = _types pushBackUnique (_split joinString "_");
    _index != -1
};

GVAR(variables) = [_units, _types];

//Create Gui to get loadout name and medic equip
[] call FUNC(createGUI);

