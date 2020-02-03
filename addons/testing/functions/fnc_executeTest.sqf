_this spawn {
    grad_testing_results = [];
    [[], _this] call grad_testing_fnc_executeContext;

    [grad_testing_results] call grad_testing_fnc_printResults;
};
