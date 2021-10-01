class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class GRAD_houseLightSwitch_fusebox {
					displayName = "Locate fuse box";
					condition = QUOTE(call FUNC(condition));
					exceptions[] = {};
					statement = QUOTE(call FUNC(action_fusebox));
					icon = "\x\grad\addons\houseLightSwitch\ui\bulb-question.paa";
				};
			};
		};
	};

	class ThingX;
    class Grad_Fuse_Box: ThingX {
        author = "Salbei";
        scope = 1;
        displayName = "Fuse Box";
        model = QPATHTOF(data\fuseBox.p3d);
        mass = 10;
        class AnimationSources
        {
            class fuseBox_open
            {
                source = "user";	// The controller is defined as a user animation.
                animPeriod = 1;		// The animation period used for this controller.
                initPhase = 0;		// Initial phase when object is created.
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = 'alive _target && {[_player, _target, [INTERACT_EXCEPTIONS_APOBS]] call ace_common_fnc_canInteractWith}';
                class GVAR(open) {
                    selection = "";
                    displayName = CSTRING(open);
                    condition = QUOTE(_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), true)]);
                    statement = QUOTE([_target] call FUNC(open));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(close) {
                    selection = "";
                    displayName = CSTRING(close);
                    condition = QUOTE(_target getVariable [ARR_2(QUOTE(QGVAR(isClosed)), false)]);
                    statement = QUOTE([_target] call FUNC(close));
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };
};
