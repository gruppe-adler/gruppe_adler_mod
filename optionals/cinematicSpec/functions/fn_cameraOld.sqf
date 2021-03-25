//--- Classic camera script, enhanced by Karel Moricky, 2010/03/19
// ripped + modified by nomisum + fusselwurm for gruppe adler 2017

private ["_pX", "_pY", "_pZ"];

params ["_pos", "_vectorDir", "_vectorUp"];

_pX = _pos select 0;
_pY = _pos select 1;
_pZ = _pos select 2;

if (!isNil "GRAD_CINEMACAM") exitWith {};

//--- Is FLIR available
if (isNil "GRAD_CINEMACAM_ISFLIR") then {
	GRAD_CINEMACAM_ISFLIR = isClass (configFile >> "cfgpatches" >> "A3_Data_F");
};

GRAD_CINEMACAM_MAP = false;
GRAD_CINEMACAM_VISION = 0;
GRAD_CINEMACAM_FOCUS = 0;
GRAD_CINEMACAM_COLOR = ppEffectCreate ["colorCorrections", 1600];
if (isNil "GRAD_CINEMACAM_PPEFFECTS") then {
	GRAD_CINEMACAM_PPEFFECTS = [
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
GRAD_CINEMACAM = _local;
_local camCommand "MANUAL ON";
_local camCommand "INERTIA ON";
_local cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;
GRAD_CINEMACAM setVectorDir _vectorDir;
GRAD_CINEMACAM setVectorUp _vectorUp;


_mapIconEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", '
	if (isNil "GRAD_CINEMACAM" || {isNull GRAD_CINEMACAM}) exitWith { ((finddisplay 12) displayctrl 51) ctrlremoveeventhandler ["Draw",_this]; };
    (_this select 0) drawIcon [
        gettext (configfile >> "RscDisplayCamera" >> "iconCamera"),
        [0,1,1,1],
		position GRAD_CINEMACAM,
		32,
		32,
		direction GRAD_CINEMACAM,
		"",
		1
    ];

'];


//--- Key Down
_keyDown = (findDisplay 46) displayAddEventHandler ["keydown","
	_key = _this select 1;
	_ctrl = _this select 3;

	if (_key in (actionkeys 'nightvision')) then {
		GRAD_CINEMACAM_VISION = GRAD_CINEMACAM_VISION + 1;
		if (GRAD_CINEMACAM_ISFLIR) then {
					_vision = GRAD_CINEMACAM_VISION % 4;
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
			_vision = GRAD_CINEMACAM_VISION % 2;
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
		if (GRAD_CINEMACAM_MAP) then {
			openmap [false,false];
			GRAD_CINEMACAM_MAP = false;
		} else {
			openmap [true,true];
			GRAD_CINEMACAM_MAP = true;
			mapanimadd [0,0.1,position GRAD_CINEMACAM];
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
	if (_key == 83 && !isnil 'GRAD_CINEMACAM_LASTPOS') then {
		GRAD_CINEMACAM setpos GRAD_CINEMACAM_LASTPOS;
	};

	if (_key == 41) then {
		GRAD_CINEMACAM_COLOR ppeffectenable false;
	};
	if (_key >= 2 && _key <= 11) then {
		_id = _key - 2;
		if (_id < count GRAD_CINEMACAM_PPEFFECTS) then {
			GRAD_CINEMACAM_COLOR ppEffectAdjust (GRAD_CINEMACAM_PPEFFECTS select _id);
			GRAD_CINEMACAM_COLOR ppEffectCommit 0;
			GRAD_CINEMACAM_COLOR ppeffectenable true;
		};
	};
"];

//--- focus on someone
_mousebuttonclick_focus = (findDisplay 46) displayAddEventHandler ["MouseButtonDblClick","
	_n = _this select 0;
	GRAD_CINEMACAM_FOCUS = GRAD_CINEMACAM_FOCUS + _n/10;
	if (_n > 0 && GRAD_CINEMACAM_FOCUS < 0) then {GRAD_CINEMACAM_FOCUS = 0};
	if (GRAD_CINEMACAM_FOCUS < 0) then {GRAD_CINEMACAM_FOCUS = -1};
	GRAD_CINEMACAM camcommand 'manual off';
	GRAD_CINEMACAM campreparefocus [GRAD_CINEMACAM_FOCUS,1];
	GRAD_CINEMACAM camcommitprepared 0;
	GRAD_CINEMACAM camcommand 'manual on';
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
			GRAD_CINEMACAM setpos [_worldpos select 0,_worldpos select 1,position GRAD_CINEMACAM select 2];
		};
	};
"];




//Wait until destroy is forced or camera auto-destroyed.
[_local,_keyDown,_mousebuttonclick_focus,_map_mousebuttonclick, _mapIconEH] spawn {
	private ["_lastpos", "_lastVectorUp", "_lastVectorDir"];

	params ["_local", "_keyDown", "_mousebuttonclick_focus", "_map_mousebuttonclick", "_mapIconEH"];

	waitUntil {
		if (!isNull GRAD_CINEMACAM) then {
				_lastpos = position GRAD_CINEMACAM; 
				_lastVectorUp = vectorUp GRAD_CINEMACAM;
				_lastVectorDir = vectorDir GRAD_CINEMACAM;
			};
		isNull GRAD_CINEMACAM
	};

	player cameraEffect ["TERMINATE", "BACK"];
	GRAD_CINEMACAM = nil;
	GRAD_CINEMACAM_MAP = nil;
	GRAD_CINEMACAM_VISION = nil;
	camDestroy _local;
	GRAD_CINEMACAM_LASTPOS = _lastpos;
	GRAD_CINEMACAM_VECTORUP = _lastVectorUp;
	GRAD_CINEMACAM_VECTORDIR = _lastVectorDir;

	ppEffectDestroy GRAD_CINEMACAM_COLOR;
	(findDisplay 46) displayRemoveEventHandler ["keydown",_keyDown];
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDblClick",_mousebuttonclick_focus];
	((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["mousebuttonclick",_map_mousebuttonclick];
	((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_mapIconEH];

};