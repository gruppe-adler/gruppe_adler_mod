#include "script_component.hpp"

_priority = 1500;
while {GVAR(oxygenDep_CC) = ppEffectCreate ["ColorCorrections", _priority]; GVAR(oxygenDep_CC) < 0} do {
	_priority = _priority + 1;
};
GVAR(oxygenDep_CC) ppEffectEnable true;
GVAR(oxygenDep_CC) ppEffectForceInNVG true;
GVAR(oxygenDep_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(oxygenDep_CC) ppEffectCommit 0.4;


_priority = 400;
while {GVAR(noGoggles_CC) = ppEffectCreate ["DynamicBlur", _priority]; GVAR(noGoggles_CC) < 0} do {
	_priority = _priority + 1;
};
GVAR(noGoggles_CC) ppEffectEnable true;
GVAR(noGoggles_CC) ppEffectForceInNVG false;
GVAR(noGoggles_CC) ppEffectAdjust [0];
GVAR(noGoggles_CC) ppEffectCommit 0.4;
