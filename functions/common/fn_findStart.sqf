private ["_result","_roadSegments","_nearUrban","_found","_pos","_pos_rnd"];

_pos = [];
_found = 0;

while {_found == 0} do {

_pos_rnd = call SL_fnc_randPos;

_result = _pos_rnd isFlatEmpty [-1, -1, 0.5, 20, 0, false, objNull];
_roadSegments = _pos_rnd nearRoads 50;

// && ([surfaceType _pos_rnd,"Forest"] call CBA_fnc_find != -1)
if ( (count _result > 0) && (count _roadSegments == 0) && (!surfaceIsWater _pos_rnd) && ( count (_pos_rnd nearObjects ["House", 150]) == 0 ) ) then {
  _found = 1;
  _pos = _pos_rnd;
};

/*
  _marker = [(format["marker%1",random 999999]),_pos_rnd,"ICON",[1,1],"TYPE:","mil_dot","COLOR:","ColorGreen"] call CBA_fnc_createMarker;
} else {
  _marker = [(format["marker%1",random 999999]),_pos_rnd,"ICON",[1,1],"TYPE:","mil_dot","COLOR:","ColorRed"] call CBA_fnc_createMarker;
};
*/

};

_pos
