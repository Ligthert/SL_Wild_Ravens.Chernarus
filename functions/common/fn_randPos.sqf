private ["_pos_rnd"];

_pos_rnd = [mapCenter,random (mapSize * 0.35),random 360] call BIS_fnc_relPos;
_pos_rnd
