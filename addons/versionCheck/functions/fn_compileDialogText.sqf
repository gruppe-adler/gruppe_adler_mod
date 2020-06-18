#include "..\script_component.hpp"

private _dialogTextArray = [];


if (count GVAR(versionMismatches) > 0) then {
    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Version mismatches:"]);

    {
        _x params ["_addon","_serverVersion","_clientVersion"];
        _dialogTopicArray pushBack (format ["- %1, loaded: %2, required: %3",_addon,_clientVersion,_serverVersion]);
    } forEach GVAR(versionMismatches);
};

if (count GVAR(missingAddonsClient) > 0) then {
    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Missing addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach GVAR(missingAddonsClient);
};

if (count GVAR(missingAddonsServer) > 0) then {

    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Additional addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach GVAR(missingAddonsServer);
};

if (count GVAR(clientUsesPatching) > 0) then {

    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Using file patching for addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach GVAR(clientUsesPatching);
};

private _dialogComposeArray = [];
{
    {
        _dialogComposeArray pushBack _x;
        _dialogComposeArray pushBack lineBreak;
    } forEach _x;
    _dialogComposeArray pushBack lineBreak;
} forEach _dialogTextArray;



composeText _dialogComposeArray
