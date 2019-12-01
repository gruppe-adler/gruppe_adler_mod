params [
    ["_cinematicOn", true]
];

if (_cinematicOn) then {

    // re-activate spec mode that we implictly switched off
    // see https://github.com/acemod/ACE3/blob/e2ac18a/addons/spectator/functions/fnc_setSpectator.sqf#L52-L53
    if (["acre_sys_radio"] call ace_common_fnc_isModLoaded)) then {[true] call acre_api_fnc_setSpectator};
    if (["task_force_radio"] call ace_common_fnc_isModLoaded) then {
        [player, true] call TFAR_fnc_forceSpectator;


    };
    //


} else {

};
