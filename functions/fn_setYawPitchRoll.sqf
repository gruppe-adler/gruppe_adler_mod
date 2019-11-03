params [
    ["_object", objNull],
    ["_yaw", 0],
    ["_pitch", 0],
    ["_roll", 0]
];
_object setVectorDirAndUp [
    [ sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
    [
        [ sin _roll, -sin _pitch, cos _roll * cos _pitch],
        -_yaw
    ] call BIS_fnc_rotateVector2D
];
