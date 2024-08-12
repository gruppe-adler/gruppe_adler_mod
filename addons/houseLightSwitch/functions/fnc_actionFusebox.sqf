#include "script_component.hpp"

private _building = GVAR(house);
private _fusebox = _building getVariable [QGVAR(fusebox), objNull];

if !(isNull _fusebox) exitWith {
	if (GVAR(allowMarker3D)) then {
		[{	
				params ["_args", "_handle"];
				_args params ["_pos", "_time"];

				if ((diag_tickTime - _time) > GVAR(markerShowTime)) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
	
    			drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Actions\ico_cpt_batt_OFF_ca.paa", [1,1,1,1], _pos, 1, 1, 0];
			}, 0, [(_fusebox modelToWorld (boundingCenter _fusebox)), diag_tickTime]] call CBA_fnc_addPerFrameHandler;
	} else {

	};
};

[_building] call FUNC(ensureFusebox);
