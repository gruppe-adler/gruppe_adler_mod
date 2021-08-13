#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_ctrlButtonDelete"];

private _display = ctrlParent _ctrlButtonDelete;
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
private _ctrlEditName = _display displayCtrl IDC_EDITNAME;

private _saveID = _ctrlSavesList lnbValue [lnbCurSelRow _ctrlSavesList,0];

private _saveMarkersData = profileNamespace getVariable [QGVAR(saveData),[]];
_saveMarkersData deleteAt _saveID;
saveProfileNamespace;

[_display] call FUNC(updateSavesList);
_ctrlSavesList lnbSetCurSelRow -1;
_ctrlEditName ctrlSetText "";
