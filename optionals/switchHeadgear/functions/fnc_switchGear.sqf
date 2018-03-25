if !(hasInterface) exitWith {};

_loadout = getUnitLoadout player;
_helmet = (_loadout select 6);
_headgear = player getVariable ["GRAD_switchHeadgear", Nil];
_str = "";
if (isNil "_headgear" && (isNil "_helmet")) exitWith {};
switch (true) do {
    case (isNil "_headgear") : {
        player setVariable ["GRAD_switchHeadgear", _helmet];
        _loadout set [6, ""];
        _str = "Helmet stored";
    };
    case (isNil "_helmet") : {
        player setVariable ["GRAD_switchHeadgear", Nil];
        _loadout set [6, _headgear];
        _str = "Helmet equipped";
    };
    default : {
        player setVariable ["GRAD_switchHeadgear", _helmet];
        _loadout set [6, _headgear];
        _str = format ["Helmet: %1 equipped, %2 stored",_headgear, _helmet];
    };
};

player setUnitLoadout _loadout;
hint _str;
