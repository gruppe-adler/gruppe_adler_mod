private _aceEnabled = !(isNull (uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull]));
private _stHudEnabled = !(isNil "STHud_UIMode");

if (isNil "GRAD_screenshotMode_var") then {
//HIDE HUD
     GRAD_screenshotMode_var = [+(shownHUD)];

     if (_stHudEnabled) then {
          GRAD_screenshotMode_var pushBack STHud_UIMode;
     } else {
          GRAD_screenshotMode_var pushBack -1;
     };

     if (_aceEnabled) then {
          GRAD_screenshotMode_var pushBack (ctrlShown (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer"));
          GRAD_screenshotMode_var pushBack ace_nametags_showplayernames;
     } else {
          GRAD_screenshotMode_var pushBack -1;
          GRAD_screenshotMode_var pushBack -1;
     };

     showHUD [false,false,false,false,false,false,false,false];

     if (_stHudEnabled) then {
          STHud_UIMode = 0;
     };

     if (_aceEnabled) then {
          (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer") ctrlShow false;
          ace_nametags_showplayernames = 0;
     };

} else {
//SHOW HUD
     showHUD (GRAD_screenshotMode_var select 0);

     if (_stHudEnabled) then {
          STHud_UIMode = (GRAD_screenshotMode_var select 1);
     };

     if (_aceEnabled) then {
          (uiNamespace getVariable "ace_advanced_fatigue_staminaBarContainer") ctrlShow (GRAD_screenshotMode_var select 2);
          ace_nametags_showplayernames = (GRAD_screenshotMode_var select 3);
     };

     GRAD_screenshotMode_var = nil;
};

false;
