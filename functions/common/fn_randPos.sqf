private ["_pos_rnd"];

_pos_rnd = [mapCenter,((mapSize * 0.25) + random (mapSize * 0.25)),random 360] call BIS_fnc_relPos;
_pos_rnd
