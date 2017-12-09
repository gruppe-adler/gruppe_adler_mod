#include "..\script_component.hpp"

params [["_text",""]];

if (isNull (findDisplay 46)) exitWith {
    [{!isNull (findDisplay 46)},grad_versionCheck_fnc_openDialog,_this] call CBA_fnc_waitUntilAndExecute;
};


private _display = (findDisplay 46) createDisplay "grad_RscDisplayVersionCheck";
private _textCtrl = _display displayCtrl 1100;
_textCtrl ctrlSetStructuredText ([] call grad_versionCheck_fnc_compileDialogText);

private _textCtrlPos = ctrlPosition _textCtrl;
_textCtrlPos set [3,ctrlTextHeight _textCtrl + 0.03];
_textCtrl ctrlSetPosition _textCtrlPos;
_textCtrl ctrlCommit 0;


private _kickOnMismatch = "grad_versionCheck_setting_kickOnVersionMismatch" call CBA_settings_fnc_get;
private _kickOnMissingClient = "grad_versionCheck_setting_kickOnMissingClient" call CBA_settings_fnc_get;
private _kickOnMissingServer = "grad_versionCheck_setting_kickOnMissingServer" call CBA_settings_fnc_get;
private _kick = switch (true) do {
    case (_kickOnMismatch && count grad_versionCheck_versionMismatches > 0): {true};
    case (_kickOnMissingClient && count grad_versionCheck_missingAddonsClient > 0): {true};
    case (_kickOnMissingServer && count grad_versionCheck_missingAddonsServer > 0): {true};
    default {false};
};


if (_kick) then {
    _display displayAddEventHandler ["Unload",{
        [{endMission "END1"},[],1] call CBA_fnc_waitAndExecute;
    }];
};
