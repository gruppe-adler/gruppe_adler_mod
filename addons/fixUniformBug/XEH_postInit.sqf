{
	_x addEventHandler ["Local", {
		_this call FUNC(checkAI);
	}];
}forEach (allUnits - (playableUnits + switchableUnits));
