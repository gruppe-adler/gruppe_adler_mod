#include "script_component.hpp"

private _title = "Admin Messages";
private _helpText = "This adds a message box to the escape menu. Allows players to send message to all admins and curators. You can use this to ask for tech support without ruining immersion by using global chat.";

[_title,_helpText] call EFUNC(ui,addHelpRecord);
