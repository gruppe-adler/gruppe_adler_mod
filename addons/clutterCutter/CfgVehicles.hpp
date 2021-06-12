class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class AFI_CutterAction {
					displayName = "Remove clutter";
					condition = "player == (vehicle player)";
					exceptions[] = {};
					statement = "player playActionNow 'medic'; [4, [], {_obj = createVehicle ['Land_ClutterCutter_medium_F', position player, [], 0, 'CAN_COLLIDE'];}, {player playActionNow 'medicstop';}, 'Removing clutter...'] call ace_common_fnc_progressBar";
					icon = "\x\grad\addons\clutterCutter\ui\cutterIcon.paa";
				};
			};
		};
	};
};