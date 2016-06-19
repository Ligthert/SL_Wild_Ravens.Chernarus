private ["_pos","_marker","_sizeA","_sizeB","_angle","_size"];

_pos 	= _this select 0;
_sizeA	= _this select 1;
_sizeB	= _this select 2;
_angle	= _this select 3;

//_pos = [_pos, random _size, random 190] call BIS_fnc_relPos;
if ( _sizeA > _sizeB) then { _size = _sizeA; } else { _size = _sizeB; };

_marker = createMarker [format["city%1",random 9999],_pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_size,_size];
_marker setMarkerAlpha 0.8;
_marker setMarkerDir _angle;
_marker setMarkerColor "ColorRed";
_marker setMarkerBrush "FDiagonal";

_marker;
