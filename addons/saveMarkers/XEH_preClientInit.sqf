#include "script_component.hpp"


private _title = "Save Markers";
private _helpText = "
If you slotted for a commanding role in an upcoming mission, this tool will come in handy. Save Markers allows you to save any markers from one mission and load them in another. That means you can just start a game in advance to the actual mission, draw your plan on the map, and save it for later. On gameday, you can load your markers instantly, saving valuable preparation time.<br/>
<br/>
You can open the Save Marker dialog with the chatcommand '#grad-saveMarkers', or by clicking here:<br/>
<execute expression='openMap [false,false]; [grad_saveMarkers_fnc_loadDisplay,[]] call CBA_fnc_execNextFrame;'>[Open Save Markers]</execute>
";

[_title,_helpText] call EFUNC(ui,addHelpRecord);

["grad-saveMarkers",{
    [] call FUNC(openDialog);
},"all"] call CBA_fnc_registerChatCommand;

[] call FUNC(loadNotification);
