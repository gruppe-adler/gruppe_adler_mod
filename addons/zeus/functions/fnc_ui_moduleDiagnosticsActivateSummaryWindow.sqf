#include "script_component.hpp"

params [["_activate",false]];

private _fnc_toggleInterface = {
    _summaryWindowCtrl = uiNamespace getVariable [QGVAR(summaryWindowCtrl),controlNull];
    if (isNull _summaryWindowCtrl) exitWith {};

    _summaryWindowCtrl ctrlShow (uinamespace getvariable "RscDisplayCurator_screenshotMode");
};


if (_activate) then {
    if (!isNil QGVAR(toggleInterfaceKeyEHs)) exitWith {};
    GVAR(toggleInterfaceKeyEHs) = [];
    {
        GVAR(toggleInterfaceKeyEHs) pushBack ([_x,[false,false,false],_fnc_toggleInterface] call CBA_fnc_addKeyHandler);
        nil
    } count (actionKeys "curatorToggleInterface");
} else {
    {
        [_x] call CBA_fnc_removeKeyHandler;
        nil
    } count GVAR(toggleInterfaceKeyEHs);
    GVAR(toggleInterfaceKeyEHs) = nil;
};
