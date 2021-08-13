//--- Classic camera script, enhanced by Karel Moricky, 2010/03/19
// ripped + modified by nomisum + fusselwurm for gruppe adler 2017

private ["_pX", "_pY", "_pZ"];

params ["_pos", "_vectorDir", "_vectorUp"];

_pX = _pos select 0;
_pY = _pos select 1;
_pZ = _pos select 2;

if (!isNil QGVAR(cam)) exitWith {};

//--- Is FLIR available
if (isNil QGVAR(isFLIR)) then {
	GVAR(isFLIR) = isClass (configFile >> "cfgpatches" >> "A3_Data_F");
};

GVAR(map) = false;
GVAR(vision) = 0;
GVAR(focus) = 0;
GVAR(color) = ppEffectCreate ["colorCorrections", 1600];
if (isNil QGVAR(ppEffects)) then {
	GVAR(ppEffects) = [
		[1, 1, -0.01, [1.0, 0.6, 0.0, 0.005], [1.0, 0.96, 0.66, 0.55], [0.95, 0.95, 0.95, 0.0]],
		[1, 1.02, -0.005, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.6, 0.65],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 1, 0.5],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.06, -0.01, [0.0, 0.0, 0.0, 0.0], [0.44, 0.26, 0.078, 0],  [0.199, 0.587, 0.114, 0.0]]
	];
};

//--- Undefined
if (typeName _this != typeName objNull) then {_this = cameraOn};

private ["_local"];
_local = "camera" camCreate [_pX, _pY, _pZ];
GVAR(cam) = _local;
_local camCommand "MANUAL ON";
_local camCommand "INERTIA ON";
_local cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;
GVAR(cam) setVectorDir _vectorDir;
GVAR(cam) setVectorUp _vectorUp;


_mapIconEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", '
	if (isNil QGVAR(cam) || {isNull GVAR(cam)}) exitWith { ((finddisplay 12) displayctrl 51) ctrlremoveeventhandler ["Draw",_this]; };
    (_this select 0) drawIcon [
        gettext (configfile >> "RscDisplayCamera" >> "iconCamera"),
        [0,1,1,1],
		position GVAR(cam),
		32,
		32,
		direction GVAR(cam),
		"",
		1
    ];

'];


//--- Key Down
_keyDown = (findDisplay 46) displayAddEventHandler ["keydown","
	_key = _this select 1;
	_ctrl = _this select 3;

	if (_key in (actionkeys 'nightvision')) then {
		GVAR(vision) = GVAR(vision) + 1;
		if (GVAR(isFLIR)) then {
					_vision = GVAR(vision) % 4;
			switch (_vision) do {
				case 0: {
					camusenvg false;
					call compile 'false SetCamUseTi 0';
				};
				case 1: {
					camusenvg true;
					call compile 'false SetCamUseTi 0';
				};
				case 2: {
					camusenvg false;
					call compile 'true SetCamUseTi 0';
				};
				case 3: {
					camusenvg false;
					call compile 'true SetCamUseTi 1';
				};
			};
		} else {
			_vision = GVAR(vision) % 2;
			switch (_vision) do {
				case 0: {
					camusenvg false;
				};
				case 1: {
					camusenvg true;
				};
			};
		};
	};

	if (_key in (actionkeys 'showmap')) then {
		if (GVAR(map)) then {
			openmap [false,false];
			GVAR(map) = false;
		} else {
			openmap [true,true];
			GVAR(map) = true;
			mapanimadd [0,0.1,position GVAR(cam)];
			mapanimcommit;
		};
	};

	if (_key == 55) then {
		_worldpos = screentoworld [.5,.5];
		if (_ctrl) then {
			vehicle player setpos _worldpos;
		} else {
			copytoclipboard str _worldpos;
		};
	};
	if (_key == 83 && !isnil QGVAR(lastPos)) then {
		GVAR(cam) setpos GVAR(lastPos);
	};

	if (_key == 41) then {
		GVAR(color) ppeffectenable false;
	};
	if (_key >= 2 && _key <= 11) then {
		_id = _key - 2;
		if (_id < count GVAR(ppEffects)) then {
			GVAR(color) ppEffectAdjust (GVAR(ppEffects) select _id);
			GVAR(color) ppEffectCommit 0;
			GVAR(color) ppeffectenable true;
		};
	};
"];

//--- focus on someone
_mousebuttonclick_focus = (findDisplay 46) displayAddEventHandler ["MouseButtonDblClick","
	_n = _this select 0;
	GVAR(focus) = GVAR(focus) + _n/10;
	if (_n > 0 && GVAR(focus) < 0) then {GVAR(focus) = 0};
	if (GVAR(focus) < 0) then {GVAR(focus) = -1};
	GVAR(cam) camcommand 'manual off';
	GVAR(cam) campreparefocus [GVAR(focus),1];
	GVAR(cam) camcommitprepared 0;
	GVAR(cam) camcommand 'manual on';
"];


_map_mousebuttonclick = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["mousebuttonclick","
	_button = _this select 1;
	_ctrl = _this select 5;
	if (_button == 0) then {
		_x = _this select 2;
		_y = _this select 3;
		_worldpos = (_this select 0) posscreentoworld [_x,_y];
		if (_ctrl) then {
			_veh = vehicle player;
			_veh setpos [_worldpos select 0,_worldpos select 1,position _veh select 2];
		} else {
			GVAR(cam) setpos [_worldpos select 0,_worldpos select 1,position GVAR(cam) select 2];
		};
	};
"];




//Wait until destroy is forced or camera auto-destroyed.
[_local,_keyDown,_mousebuttonclick_focus,_map_mousebuttonclick, _mapIconEH] spawn {
	private ["_lastpos", "_lastVectorUp", "_lastVectorDir"];

	params ["_local", "_keyDown", "_mousebuttonclick_focus", "_map_mousebuttonclick", "_mapIconEH"];

	waitUntil {
		if (!isNull GVAR(cam)) then {
				_lastpos = position GVAR(cam); 
				_lastVectorUp = vectorUp GVAR(cam);
				_lastVectorDir = vectorDir GVAR(cam);
			};
		isNull GVAR(cam)
	};

	player cameraEffect ["TERMINATE", "BACK"];
	GVAR(cam) = nil;
	GVAR(map) = nil;
	GVAR(vision) = nil;
	camDestroy _local;
	GVAR(lastPos) = _lastpos;
	GVAR(vectorUp) = _lastVectorUp;
	GVAR(vectorDir) = _lastVectorDir;

	ppEffectDestroy GVAR(color);
	(findDisplay 46) displayRemoveEventHandler ["keydown",_keyDown];
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDblClick",_mousebuttonclick_focus];
	((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["mousebuttonclick",_map_mousebuttonclick];
	((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_mapIconEH];

};