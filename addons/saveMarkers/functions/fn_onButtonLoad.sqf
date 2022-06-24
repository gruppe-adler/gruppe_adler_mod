#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_ctrlButtonLoad"];

private _display = ctrlParent _ctrlButtonLoad;
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;

private _selID = lnbCurSelRow _ctrlSavesList;
if (_selID < 0) exitWith {};

private _dataID = _ctrlSavesList lnbValue [_selID,0];
private _saveMarkersData = profileNamespace getVariable QGVAR(saveData);

(_saveMarkersData select _dataID) params ["_saveName","_mapName",["_markersData",[]]];

[_saveName,_mapName,_markersData] call FUNC(loadMarkers);

(format ["grad-saveMarkers: %1 just loaded his marker set %2.",profileName,_saveName]) remoteExec ["systemChat",0,false];

_ctrlSavesList lnbSetCurSelRow -1;
