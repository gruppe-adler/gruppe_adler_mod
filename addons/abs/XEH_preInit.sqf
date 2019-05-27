#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(bandagesOnUnit) = [];

[
   QGVAR(allowABS),
   "SCALAR",
   [
      localize LSTRING(settingAllowABS_displayName),
      localize LSTRING(settingAllowABS_tooltip)
   ],
   localize LSTRING(settingCategory),
   [
      "Disabled",
      "Medics only",
      "Everyone"
   ]
] call CBA_Settings_fnc_init;

[
   QGVAR(amountOfWoundsForABS),
   "SLIDER",
   [
      localize LSTRING(settingAmountOfWoundsForABS_displayName),
      localize LSTRING(settingAmountOfWoundsForABS_tooltip)
   ],
   localize LSTRING(settingCategory),
   [1, 100, 50, 0]
] call CBA_Settings_fnc_init;

[
   QGVAR(amountOfBandagesForABS),
   "SLIDER",
   [
      localize LSTRING(settingAmountOfBandagesForABS_displayName),
      localize LSTRING(settingAmountOfBandagesForABS_tooltip)
   ],
   localize LSTRING(settingCategory),
   [1, 100, 50, 0]
] call CBA_Settings_fnc_init;

ADDON = true;
