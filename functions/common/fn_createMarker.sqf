private ["_pos","_marker","_size"];

_pos 	= _this select 0;

//_size 	= 500 + random 250;
_size = "param_objective_size" call BIS_fnc_getParamValue;

_pos = [_pos, random ( _size * 0.9 ), random 360] call BIS_fnc_relPos;

_marker = createMarker [format["area%1",random 9999],_pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_size,_size];
_marker setMarkerAlpha 0.8;
_marker setMarkerColor "ColorRed";
_marker setMarkerBrush "FDiagonal";

_marker;
