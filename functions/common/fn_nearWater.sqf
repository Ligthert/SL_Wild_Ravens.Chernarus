private ["_pos","_distance","_waterpos","_nearwater"];

_pos = _this select 0;
_distance = _this select 1;

_nearwater = 0;

// Should be a function
for "_x" from 1 to 36 do {
  _waterpos = [_pos, _distance, _x * 10] call BIS_fnc_relPos;
  if ( surfaceIsWater _waterpos ) then { _nearwater = 1; };
};

_nearwater;
