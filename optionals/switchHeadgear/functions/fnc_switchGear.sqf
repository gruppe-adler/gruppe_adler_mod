params ["",["_unit",objNull]];

_helmet = headgear _unit;
_headgear = _unit getVariable [QGVAR(switchHeadgear), Nil];
_str = "";
if (isNil "_headgear" && (isNil "_helmet")) exitWith {};

switch (true) do {
    case (isNil "_headgear") : {
        _unit setVariable [QGVAR(switchHeadgear), _helmet];
        _newHelmet = "";
        _str = "Helmet stored";
    };
    case (isNil "_helmet") : {
        _unit setVariable [QGVAR(switchHeadgear), Nil];
        _newHelmet = _headgear;
        _str = "Helmet equipped";
    };
    default : {
        _unit setVariable [QGVAR(switchHeadgear), _helmet];
        _newHelmet = _headgear;
        _headgearName = getText (configfile >> "CfgWeapons" >> _helmet >> "displayName");
        _helmetName = getText (configfile >> "CfgWeapons" >> _headgear >> "displayName");
        _str = format ["Helmet: %1 equipped, %2 stored",_headgearName, _helmetName];
    };
};

_unit addHeadgear _newHelmet;
hint _str;
