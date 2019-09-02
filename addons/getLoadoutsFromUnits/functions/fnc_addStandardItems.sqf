#include "script_component.hpp"

params ["_unit"];

private _loadout = getUnitLoadout _unit;

if (isNil "_loadout" || {_loadout isEqualTo []}) exitWith {diag_log "GRAD_Mod getLoadouts from Unit: Loadout is Nil!"};

if !((_loadout select 3) isEqualTo []) then {
    private _items = (_loadout select 3);

    _items set [1, 
        [
            ["ACE_MapTools", 1],
            ["ACE_DefusalKit", 1],
            ["ACE_CableTie", 2],
            ["ACE_Flashlight_MX991", 1],
            ["ACE_packingBandage", 4],
            ["ACE_elasticBandage", 4],
            ["ACE_quikclot", 4],
            ["ACE_tourniquet", 4],
            ["ACE_morphine", 2],
            ["ACE_epinephrine", 2]
        ]
    ];

    _loadout set [3, _items];
    _unit setUnitLoadout _loadout;
};
