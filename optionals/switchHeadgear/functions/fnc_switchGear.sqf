params ["",["_unit",objNull]];

_loadout = getUnitLoadout _unit;
_helmet = (_loadout select 6);
_headgear = _unit getVariable [QGVAR(switchHeadgear), Nil];
_str = "";
if (isNil "_headgear" && (isNil "_helmet")) exitWith {};
switch (true) do {
    case (isNil "_headgear") : {
        _unit setVariable [QGVAR(switchHeadgear), _helmet];
        _loadout set [6, ""];
        _str = "Helmet stored";
    };
    case (isNil "_helmet") : {
        _unit setVariable [QGVAR(switchHeadgear), Nil];
        _loadout set [6, _headgear];
        _str = "Helmet equipped";
    };
    default : {
        _unit setVariable [QGVAR(switchHeadgear), _helmet];
        _loadout set [6, _headgear];
        _str = format ["Helmet: %1 equipped, %2 stored",_headgear, _helmet];
    };
};

_unit setUnitLoadout _loadout;
hint _str;
