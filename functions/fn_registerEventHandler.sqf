
["GRAD_animalTransport_vehicle_loadAnimal", {
    scriptName "GRAD_animalTransport_vehicle_loadAnimal";
    _this call GRAD_animalTransport_fnc_vehicle_loadAnimal;
}] call CBA_fnc_addEventHandler;

["GRAD_animalTransport_vehicle_unloadAnimal", {
    scriptName "GRAD_animalTransport_vehicle_unloadAnimal";
    _this call GRAD_animalTransport_fnc_vehicle_unloadAnimal;
}] call CBA_fnc_addEventHandler;
