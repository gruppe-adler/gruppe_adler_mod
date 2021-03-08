params ["_unit", "_isLocal"];

if !(_isLocal) then {
	[_unit] call FUNC(resetUniform);
};
