#include "script_component.hpp"

params [["_activate",false]];

private _fnc_toggleInterface = {
    _summaryWindowCtrlGrp = uiNamespace getVariable [QGVAR(summaryWindowCtrlGrp),controlNull];
    if (isNull _summaryWindowCtrlGrp) exitWith {};
    _summaryWindowCtrlGrp ctrlShow (uinamespace getvariable "RscDisplayCurator_screenshotMode");
};


if (_activate) then {
    if (isNil QGVAR(toggleInterfaceKeyEHs)) then {
        GVAR(toggleInterfaceKeyEHs) = [];
        {
            GVAR(toggleInterfaceKeyEHs) pushBack ([_x,[false,false,false],_fnc_toggleInterface] call CBA_fnc_addKeyHandler);
            nil
        } count (actionKeys "curatorToggleInterface");
    };

    if (isNil QGVAR(summaryWindowUpdatePFH)) then {
        GVAR(summaryWindowUpdatePFH) = [FUNC(ui_moduleDiagnosticsUpdateSummaryWindow),1,[0]] call CBA_fnc_addPerFrameHandler;
    };

} else {
    {
        [_x] call CBA_fnc_removeKeyHandler;
        nil
    } count GVAR(toggleInterfaceKeyEHs);
    GVAR(toggleInterfaceKeyEHs) = nil;

    [GVAR(summaryWindowUpdatePFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(summaryWindowUpdatePFH) = nil;
};
