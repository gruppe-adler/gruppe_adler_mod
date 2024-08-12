#include "script_component.hpp"

private _cursorTarget = cursorTarget;

private _isUnderSomething = lineIntersectsObjs [getposASL ace_player, getposASL ace_player vectorAdd [0, 0, 20]] isNotEqualTo [];
private _pointsAtHouse = _cursorTarget isKindOf "House" || {_cursorTarget isKindOf "Building"};

if (_pointsAtHouse && {_isUnderSomething}) then {
	GVAR(house) = _cursorTarget;
	true
} else {
	false
};
