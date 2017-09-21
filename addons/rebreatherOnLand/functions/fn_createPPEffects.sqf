_priority = 1500;
while {grad_rebreatherOnLand_oxygenDep_CC = ppEffectCreate ["ColorCorrections", _priority]; grad_rebreatherOnLand_oxygenDep_CC < 0} do {
	_priority = _priority + 1;
};
grad_rebreatherOnLand_oxygenDep_CC ppEffectEnable true;
grad_rebreatherOnLand_oxygenDep_CC ppEffectForceInNVG true;
grad_rebreatherOnLand_oxygenDep_CC ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
grad_rebreatherOnLand_oxygenDep_CC ppEffectCommit 0.4;


_priority = 400;
while {grad_rebreatherOnLand_noGoggles_CC = ppEffectCreate ["DynamicBlur", _priority]; grad_rebreatherOnLand_noGoggles_CC < 0} do {
	_priority = _priority + 1;
};
grad_rebreatherOnLand_noGoggles_CC ppEffectEnable true;
grad_rebreatherOnLand_noGoggles_CC ppEffectForceInNVG false;
grad_rebreatherOnLand_noGoggles_CC ppEffectAdjust [0];
grad_rebreatherOnLand_noGoggles_CC ppEffectCommit 0.4;
