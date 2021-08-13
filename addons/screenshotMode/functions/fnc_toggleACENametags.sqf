#include "script_component.hpp"

private _staminaBar = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
private _aceEnabled = !(isNull _staminaBar);
private _newState = param [0, true];

if (!_aceEnabled) exitWith {};

if (_newState) then {
    _staminaBar ctrlShow GVAR(staminaBarContainer);
    ace_nametags_showplayernames = GVAR(playerNames);
} else {
    GVAR(staminaBarContainer) = ctrlShown _staminaBar;
    GVAR(playerNames) = ace_nametags_showplayernames;

    _staminaBar ctrlShow false;
    ace_nametags_showplayernames = 0;
};
