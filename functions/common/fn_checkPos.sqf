private ["_retval","_pos","_result","_roadSegments"];

_pos = _this select 0;
_retval = false;

_result = _pos isFlatEmpty [-1, -1, 0.5, 20, 0, false, objNull];
_roadSegments = _pos nearRoads 50;

if ( (count _result > 0) && (count _roadSegments == 0) && (!surfaceIsWater _pos) && ( count (_pos nearObjects ["House", 50]) == 0 ) && _pos select 0 > 0 && _pos select 0 < mapSize && _pos select 1 > 0 && _pos select 1 < mapSize ) then {
  _retval = true;
};

_retval
