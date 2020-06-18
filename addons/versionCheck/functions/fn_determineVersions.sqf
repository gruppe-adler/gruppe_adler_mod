#include "..\script_component.hpp"

GVAR(versions) = [[],nil] call CBA_fnc_hashCreate;


{
    private _addonClass = _x;
    private _name = toLower configName _addonClass;
    private _vNo = [_addonClass] call FUNC(getVersionNo);
    private _isPatched = false;
    if (_name find "a3" != 0) then {
        [GVAR(versions), _name, [_version, _isPatched]] call CBA_fnc_hashSet;
    };
} forEach ("true" configClasses (configFile >> "CfgPatches"));
