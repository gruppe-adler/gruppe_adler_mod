#include "script_component.hpp"

private _title = "Zeus";
private _helpText = "
Gruppe Adler Mod adds a collection of new Zeus modules:<br/>
<br/>
<font face='RobotoCondensedLight'>Add Players to Zeus</font><br/>
Drop this anywhere to add all players to the Zeus interface.<br/>
<br/>
<font face='RobotoCondensedLight'>Blacklist Headless Transfer</font><br/>
Drop this module on a unit. This will blacklist the unit's group from being automatically transferred to a headless client. In the dialog, you can optionally choose to transfer the ownership to either server or player.<br/>
<br/>
<font face='RobotoCondensedLight'>Monitoring</font><br/>
Drop this module anywhere. A settings window will pop up allowing you to toggle monitoring of different parameters, including player FPS, medical status, AI status and some more.<br/>
<br/>
<font face='RobotoCondensedLight'>Move Respawn Position</font><br/>
Drop this module anywhere, then select a side to move that side's respawn position to the module. Keep in mind that the respawn position is also where JIP players spawn.<br/>
<br/>
<font face='RobotoCondensedLight'>Reload Loadout</font><br/>
Drop this on a unit. If the unit has a grad-loadout assigned, it will be reloaded.<br/>
<br/>
<font face='RobotoCondensedLight'>Set Faction Loadout</font><br/>
Drop this anywhere or on a unit. Select a loadout for a faction. Units of the selected faction will now spawn with the selected loadout.<br/>
<br/>
<font face='RobotoCondensedLight'>Supply Drop</font><br/>
Place a container (like an ammo box) somewhere on the map. Fill it to your liking. Drop this module on the container. Select an aircraft from the list that pops up. Select a target position for the drop to land. The selected aircraft will then proceed to paradrop your container at the position.<br/>
<br/>
<font face='RobotoCondensedLight'>Toggle BFT</font><br/>
Drop this anywhere. Toggles Blue Force Tracking.<br/>";

[_title,_helpText] call EFUNC(ui,addHelpRecord);

[
    "TFAR_event_OnSWchannelSet",
    {
        params ["_unit", "", "_channel", "_additional"];

        private _freq = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_getChannelFrequency;

        if (_additional) then {
            _unit setVariable [QGVAR(freqAdditionalSW), _freq];
        }else{
            _unit setVariable [QGVAR(freqSW), _freq];
        };
    }
] call CBA_fnc_addEventHandler;

[
    "TFAR_event_OnLRchannelSet",
    {
        params ["_unit", "", "_channel", "_additional"];

        private _freq = [(call TFAR_fnc_activeLRRadio), _channel] call TFAR_fnc_getChannelFrequency;

        if (_additional) then {
            _unit setVariable [QGVAR(freqAdditionalLR), _freq];
        }else{
            _unit setVariable [QGVAR(freqLR), _freq];
        };
    }
] call CBA_fnc_addEventHandler;
