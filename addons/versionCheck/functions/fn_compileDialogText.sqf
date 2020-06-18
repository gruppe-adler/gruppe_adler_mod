#include "..\script_component.hpp"

private _dialogTextArray = [];


if (count grad_versionCheck_versionMismatches > 0) then {
    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Version mismatches:"]);

    {
        _x params ["_addon","_serverVersion","_clientVersion"];
        _dialogTopicArray pushBack (format ["- %1, loaded: %2, required: %3",_addon,_clientVersion,_serverVersion]);
    } forEach grad_versionCheck_versionMismatches;
};

if (count grad_versionCheck_missingAddonsClient > 0) then {
    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Missing addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach grad_versionCheck_missingAddonsClient;
};

if (count grad_versionCheck_missingAddonsServer > 0) then {

    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Additional addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach grad_versionCheck_missingAddonsServer;
};

if (count grad_versionCheck_clientUsesPatching > 0) then {

    _dialogTopicArray = _dialogTextArray select (_dialogTextArray pushBack ["Using file patching for addons:"]);

    {
        _dialogTopicArray pushBack (format ["- %1",_x]);
    } forEach grad_versionCheck_clientUsesPatching;
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
