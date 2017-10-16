private _aceEnabled = !(isNull (uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull]));
private _newState = param [0, true];

if (!_aceEnabled) exitWith {};

if (_newState) then {
    (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer") ctrlShow GVAR(staminaBarContainer);
    ace_nametags_showplayernames = GVAR(playerNames);
} else {
    GVAR(staminaBarContainer) = ctrlShown (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer");
    GVAR(playerNames) = ace_nametags_showplayernames;

    (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer") ctrlShow false;
    ace_nametags_showplayernames = 0;
};