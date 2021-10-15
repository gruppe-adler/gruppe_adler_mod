#include "script_component.hpp"
#define HIGHLIGHT_COLOR "#2eea54"

params ["_ctrlHelpText"];

_ctrlHelpText ctrlSetStructuredText parseText format ["<t size='0.8'>
Press <t color='%1'>[H]</t> to toggle help.<br/>
<br/>
<t color='%1'>select markers</t> - Drag with left mouse button to select markers.<br/>
<br/>
<t color='%1'>[ctrl + A]</t> - Select all markers.<br/>
<br/>
<t color='%1'>[ctrl]</t> - Hold while selecting to add to selection.<br/>
<br/>
<t color='%1'>[alt]</t> - Hold while selecting to enable selection of editor or script created markers.<br/>
<br/>
<t color='%1'>[shift]</t> - Hold while selecting to remove markers from selection.<br/>
</t>",HIGHLIGHT_COLOR];
