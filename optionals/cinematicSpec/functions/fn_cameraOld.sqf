//--- Classic camera script, enhanced by Karel Moricky, 2010/03/19
// ripped + modified by nomisum for gruppe adler 2017

private ["_pX", "_pY", "_pZ"];

params ["_pos", "_vectorDir", "_vectorUp"];

_pX = _pos select 0;
_pY = _pos select 1;
_pZ = _pos select 2;

if (!isNil "BIS_DEBUG_CAM") exitwith {};

//--- Is FLIR available
if (isnil "BIS_DEBUG_CAM_ISFLIR") then {
	BIS_DEBUG_CAM_ISFLIR = isclass (configfile >> "cfgpatches" >> "A3_Data_F");
};

BIS_DEBUG_CAM_MAP = false;
BIS_DEBUG_CAM_VISION = 0;
BIS_DEBUG_CAM_FOCUS = 0;
BIS_DEBUG_CAM_COLOR = ppEffectCreate ["colorCorrections", 1600];
if (isnil "BIS_DEBUG_CAM_PPEFFECTS") then {
	BIS_DEBUG_CAM_PPEFFECTS = [
		[1, 1, -0.01, [1.0, 0.6, 0.0, 0.005], [1.0, 0.96, 0.66, 0.55], [0.95, 0.95, 0.95, 0.0]],
		[1, 1.02, -0.005, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.6, 0.65],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 1, 0.5],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.06, -0.01, [0.0, 0.0, 0.0, 0.0], [0.44, 0.26, 0.078, 0],  [0.199, 0.587, 0.114, 0.0]]
	];
};

//--- Undefined
if (typename _this != typename objnull) then {_this = cameraon};

private ["_local"];
_local = "camera" camCreate [_pX, _pY, _pZ];
BIS_DEBUG_CAM = _local;
_local camCommand "MANUAL ON";
_local camCommand "INERTIA ON";
_local cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;
BIS_DEBUG_CAM setVectorDir _vectorDir;
BIS_DEBUG_CAM setVectorUp _vectorUp;


//--- Marker
BIS_DEBUG_CAM_MARKER = createmarkerlocal ["BIS_DEBUG_CAM_MARKER",_pos];
BIS_DEBUG_CAM_MARKER setmarkertypelocal "mil_start";
BIS_DEBUG_CAM_MARKER setmarkercolorlocal "colorpink";
BIS_DEBUG_CAM_MARKER setmarkersizelocal [.75,.75];
BIS_DEBUG_CAM_MARKER setmarkertextlocal "BIS_DEBUG_CAM";


//--- Key Down
_keyDown = (finddisplay 46) displayaddeventhandler ["keydown","
	_key = _this select 1;
	_ctrl = _this select 3;

	if (_key in (actionkeys 'nightvision')) then {
		BIS_DEBUG_CAM_VISION = BIS_DEBUG_CAM_VISION + 1;
		if (BIS_DEBUG_CAM_ISFLIR) then {
					_vision = BIS_DEBUG_CAM_VISION % 4;
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
			_vision = BIS_DEBUG_CAM_VISION % 2;
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
		if (BIS_DEBUG_CAM_MAP) then {
			openmap [false,false];
			BIS_DEBUG_CAM_MAP = false;
		} else {
			openmap [true,true];
			BIS_DEBUG_CAM_MAP = true;
			BIS_DEBUG_CAM_MARKER setmarkerposlocal position BIS_DEBUG_CAM;
			BIS_DEBUG_CAM_MARKER setmarkerdirlocal direction BIS_DEBUG_CAM;
			mapanimadd [0,0.1,position BIS_DEBUG_CAM];
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
	if (_key == 83 && !isnil 'BIS_DEBUG_CAM_LASTPOS') then {
		BIS_DEBUG_CAM setpos BIS_DEBUG_CAM_LASTPOS;
	};

	if (_key == 41) then {
		BIS_DEBUG_CAM_COLOR ppeffectenable false;
	};
	if (_key >= 2 && _key <= 11) then {
		_id = _key - 2;
		if (_id < count BIS_DEBUG_CAM_PPEFFECTS) then {
			BIS_DEBUG_CAM_COLOR ppEffectAdjust (BIS_DEBUG_CAM_PPEFFECTS select _id);
			BIS_DEBUG_CAM_COLOR ppEffectCommit 0;
			BIS_DEBUG_CAM_COLOR ppeffectenable true;
		};
	};
"];

//--- focus on someone
_mousebuttonclick_focus = (finddisplay 46) displayaddeventhandler ["MouseButtonDblClick","
	_n = _this select 0;
	BIS_DEBUG_CAM_FOCUS = BIS_DEBUG_CAM_FOCUS + _n/10;
	if (_n > 0 && BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = 0};
	if (BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = -1};
	BIS_DEBUG_CAM camcommand 'manual off';
	BIS_DEBUG_CAM campreparefocus [BIS_DEBUG_CAM_FOCUS,1];
	BIS_DEBUG_CAM camcommitprepared 0;
	BIS_DEBUG_CAM camcommand 'manual on';
"];


_map_mousebuttonclick = ((finddisplay 12) displayctrl 51) ctrladdeventhandler ["mousebuttonclick","
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
			BIS_DEBUG_CAM setpos [_worldpos select 0,_worldpos select 1,position BIS_DEBUG_CAM select 2];
			BIS_DEBUG_CAM_MARKER setmarkerposlocal _worldpos;
		};
	};
"];




//Wait until destroy is forced or camera auto-destroyed.
[_local,_keyDown,_mousebuttonclick_focus,_map_mousebuttonclick] spawn {
	private ["_local","_keyDown","_mousebuttonclick_focus","_map_mousebuttonclick","_lastpos", "_lastVectorUp", "_lastVectorDir"];

	_local = _this select 0;
	_keyDown = _this select 1;
	_mousebuttonclick_focus = _this select 2;
	_map_mousebuttonclick = _this select 3;

	waituntil {
		if (!isnull BIS_DEBUG_CAM) then {
				_lastpos = position BIS_DEBUG_CAM; 
				_lastVectorUp = vectorUp BIS_DEBUG_CAM;
				_lastVectorDir = vectorDir BIS_DEBUG_CAM;
			};
		isNull BIS_DEBUG_CAM
	};

	player cameraEffect ["TERMINATE", "BACK"];
	deletemarkerlocal BIS_DEBUG_CAM_MARKER;
	BIS_DEBUG_CAM = nil;
	BIS_DEBUG_CAM_MAP = nil;
	BIS_DEBUG_CAM_MARKER = nil;
	BIS_DEBUG_CAM_VISION = nil;
	camDestroy _local;
	BIS_DEBUG_CAM_LASTPOS = _lastpos;
	BIS_DEBUG_CAM_VECTORUP = _lastVectorUp;
	BIS_DEBUG_CAM_VECTORDIR = _lastVectorDir;

	ppeffectdestroy BIS_DEBUG_CAM_COLOR;
	(finddisplay 46) displayremoveeventhandler ["keydown",_keyDown];
	(finddisplay 46) displayremoveeventhandler ["MouseButtonDblClick",_mousebuttonclick_focus];
	((finddisplay 12) displayctrl 51) ctrlremoveeventhandler ["mousebuttonclick",_map_mousebuttonclick];

};