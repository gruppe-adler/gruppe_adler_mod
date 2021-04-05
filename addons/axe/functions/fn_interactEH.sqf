#include "script_component.hpp"

/*
*   Original function from ace_logistics_wirecutter by PabstMirror
*   Adapted for grad_axe by McDiod
*/

params ["_interactionType"];

//Ignore self-interaction menu or mounted vehicle interaction
if ((_interactionType != 0) || {(vehicle ACE_player) != ACE_player}) exitWith {};

//for performance only do stuff it they have a wirecutter item
//(if they somehow get one durring keydown they'll just have to reopen)
if (!("grad_axe" in (items ace_player))) exitWith {};

[{
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedHelpers", "_treesHelped", "_helperQueue"];

    if (!ace_interact_menu_keydown) then {
        {deleteVehicle _x; nil} count _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {

        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) > 5) then {

            private _fncStatement = {
                params ["", "_player", "_attachedTree"];
                [_player, _attachedTree] call grad_axe_fnc_cutDownTree;
            };

            private _fncCondition = {
                params ["_helper", "_player", "_attachedTree"];

                if (!([_player, _attachedTree, ["isNotSwimming"]] call ace_common_fnc_canInteractWith)) exitWith {false};

                ((!isNull _attachedTree) && {(damage _attachedTree) < 1} && {("grad_axe" in (items _player))} && {
                    //Custom LOS check for tree
                    private _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
                    ((!(lineIntersects [AGLtoASL _headPos, AGLtoASL (_helper modelToWorldVisual [0,0,1.25]), _attachedTree, ACE_player])) ||
                    {!(lineIntersects [AGLtoASL _headPos, getPosASL _attachedTree, _attachedTree, ACE_player])})
                })
            };

            {
                _treesHelped pushBack _x;
                private _helper = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                private _action = ["grad_axe_cutDownTree",localize "STR_GRAD_AXE_CUT_TREE","x\grad\addons\axe\ui\action_axe_ca.paa", _fncStatement, _fncCondition, {}, _x, {[0,0,0]}, 5.5, [false, false, false, false, true]] call ace_interact_menu_fnc_createAction;
                [_helper, 0, [],_action] call ace_interact_menu_fnc_addActionToObject;
                _addedHelpers pushBack _helper;
                _helperQueue pushBack [_helper,_x];
            } forEach (
                (nearestTerrainObjects [ace_player, ["TREE","SMALL TREE","BUSH"], 15]) select {
                    !(_x in _treesHelped) &&
                    {!isObjectHidden _x}
                }
            );

            [{
                params ["_helperQueue","_PFHID"];
                if (count _helperQueue == 0) exitWith {[_PFHID] call CBA_fnc_removePerFrameHandler};
                (_helperQueue deleteAt 0) params ["_helper","_tree"];
                _helper setPosASL ([_tree] call grad_axe_fnc_findTrunk);
            },0.1,_helperQueue] call CBA_fnc_addPerFrameHandler;

            _args set [0, (getPosASL ace_player)];
        };
    };
}, 0.1, [((getPosASL ace_player) vectorAdd [-100,0,0]),[],[],[]]] call CBA_fnc_addPerFrameHandler;
