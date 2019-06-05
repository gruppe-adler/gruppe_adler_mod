#include "script_component.hpp"

params [["_info",""],["_message",""]];

ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign format [localize "STR_grad_ADMINMESSAGES_CHANNEL",_info];

player customChat [ga_adminMessages_channel, _message];
ga_adminMessages_channel radioChannelRemove [player];
