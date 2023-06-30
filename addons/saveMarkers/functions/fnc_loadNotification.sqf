#include "script_component.hpp"

/*  Displays notification on missionstart if player can load a marker set.
*   Called from XEH_preInitClient.sqf
*/

private _saveMarkersData = profileNamespace getVariable QGVAR(saveData);
if (isNil "_saveMarkersData") exitWith {};

private _hasWorldSaveData = _saveMarkersData findIf {worldName isEqualTo (_x select 1)};
if (_hasWorldSaveData < 0) exitWith {};

[{!isNull (findDisplay 46)},{
    [{
        [QGVAR(notification),["GRAD SAVE MARKERS","You have markers that can now be loaded."]] call bis_fnc_showNotification;
    },[],10] call CBA_fnc_waitAndExecute;
},[]] call CBA_fnc_waitUntilAndExecute;
