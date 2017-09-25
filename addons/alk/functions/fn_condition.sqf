params ["_caller", "_target", "_selectionName", "_className", "_items"];

private _dam = _target getHitPointDamage (["HitHands","HitLegs"] select (_className isEqualTo "GRAD_ALK_legs"));

if (_dam isEqualTo 0 || _target getVariable ["ACE_isUnconscious", false]) exitWith {false};

true
