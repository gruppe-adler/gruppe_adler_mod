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
        params ["_unit", "_radio", "_channel", "_additional"];

        private _frequency = [(call TFAR_fnc_activeSwRadio), (_channel +1)] call TFAR_fnc_getChannelFrequency;
        if (_additional) then {
            if (_channel isEqualTo (_unit getVariable [QGVAR(channelAdditionalSW), -1])) exitWith {
                _unit setVariable [QGVAR(channelAdditionalSW), nil, true];
                _unit setVariable [QGVAR(freqAdditionalSW), nil, true];
            };
            _unit setVariable [QGVAR(channelAdditionalSW), _channel, true];
            _unit setVariable [QGVAR(freqAdditionalSW), _frequency, true];
        }else{
            _unit setVariable [QGVAR(channelSW), _channel, true];
            _unit setVariable [QGVAR(freqSW), _frequency, true];
        };
    }
] call CBA_fnc_addEventHandler;

[
    "TFAR_event_OnLRchannelSet",
    {
        params ["_unit", "", "_channel", "_additional"];

        private _frequency = [(call TFAR_fnc_activeLRRadio), (_channel +1)] call TFAR_fnc_getChannelFrequency;
        if (_additional) then {

            if (_channel isEqualTo (_unit getVariable [QGVAR(freqAdditionalLR), -1])) exitWith {
                _unit setVariable [QGVAR(channelAdditionalLR), nil, true];
                _unit setVariable [QGVAR(freqAdditionalLR), nil, true];
            };
            _unit setVariable [QGVAR(channelAdditionalLR), _channel, true];
            _unit setVariable [QGVAR(freqAdditionalLR), _frequency, true];
        }else{
            _unit setVariable [QGVAR(channelLR), _channel, true];
            _unit setVariable [QGVAR(freqLR), _frequency, true];
        };
    }
] call CBA_fnc_addEventHandler;

[
    "TFAR_event_OnFrequencyChanged",
     {
         params ["_unit", "_radio", "_channel", "", "_frequency"];

         private _backpackLR = call TFAR_fnc_activeLRRadio;
         if (_backpackLR isEqualTo _radio) then {
             if (_channel isEqualTo (_unit getVariable [QGVAR(channelLR), -1])) then {
                 _unit setVariable [QGVAR(freqLR), _frequency, true];
             }else{
                if (_channel isEqualTo (_unit getVariable [QGVAR(channelAdditionalLR), -1])) then {
                    _unit setVariable [QGVAR(freqAdditionalLR), _frequency, true];
                };
             };
         }else{
             private _loadoutRadio = call TFAR_fnc_activeSwRadio;
             if (_loadoutRadio isEqualTo _radio) then {
                 if (_channel isEqualTo (_unit getVariable [QGVAR(channelSW), -1])) then {
                     _unit setVariable [QGVAR(freqSW), _frequency, true];
                 }else{
                    if (_channel isEqualTo (_unit getVariable [QGVAR(channelAdditionalSW), -1])) then {
                        _unit setVariable [QGVAR(freqAdditionalSW), _frequency, true];
                    };
                 };
             };
         };
     }
] call CBA_fnc_addEventHandler;

["loadout", {
    //current units loadout changed, check radios
    private _loadout = getUnitLoadout player;
    if (_loadout isEqualTo []) exitWith {};
    private _linkedItems = _loadout select 9;
    if !(_linkedItems isEqualTo []) then {
        if (((player getVariable [QGVAR(channelSW), -1]) isEqualTo -1) && {!(( _linkedItems select 2) isEqualTo "")}) then {
            [] call FUNC(moduleDiagnosticsGetPlayerFreqsAtStart);
        };

        if (!((player getVariable [QGVAR(channelSW), -1]) isEqualTo -1) && {(_linkedItems select 2) isEqualTo ""}) then {
            player setVariable [QGVAR(channelSW), nil, true];
            player setVariable [QGVAR(freqSW), nil, true];
            player setVariable [QGVAR(channelAdditionalSW), nil, true];
            player setVariable [QGVAR(freqAdditionalSW), nil, true];
        };
    };

    private _backpack = _loadout select 5;
    if !(_backpack isEqualTo []) then {
        if (((player getVariable [QGVAR(channelLR), -1]) isEqualTo -1) && {!((_backpack select 0) isEqualTo "")}) then {
            [] call FUNC(moduleDiagnosticsGetPlayerFreqsAtStart);
        };

        if (!((player getVariable [QGVAR(channelLR), -1]) isEqualTo -1) && {(_backpack select 0) isEqualTo ""}) then {
            player setVariable [QGVAR(channelLR), nil, true];
            player setVariable [QGVAR(freqLR), nil, true];
            player setVariable [QGVAR(channelAdditionalLR), nil, true];
            player setVariable [QGVAR(freqAdditionalLR), nil, true];
        };
    };
}, true] call CBA_fnc_addPlayerEventHandler;
