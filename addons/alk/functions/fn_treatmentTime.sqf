#define MAXTIME 30
#define MINTIME 15

params ["_caller", "_target", "_selectionName", "_className", "_items"];

private _dam = _target getHitPointDamage (["HitHands","HitLegs"] select (_className isEqualTo "GRAD_ALK_legs"));

MINTIME max (_dam * MAXTIME)
