#include "..\script_component.hpp"

GVAR(versions) = createHashMap;


{
    private _addonClass = _x;
    private _name = toLower configName _addonClass;
    private _vNo = [_addonClass] call FUNC(getVersionNo);
    private _isPatched = false;
    if (_name find "a3" != 0) then {
        GVAR(versions) set [_name, [_vNo, _isPatched]];
    };
} forEach ("true" configClasses (configFile >> "CfgPatches"));
