private ["_pos","_players","_divider","_groups","_size","_marker","_grp"];

_pos = _this select 0;

// Replace with UPSMON patrols that scale to the amount of players.

_players = count allPlayers;
_divider =  _players/("param_enemy_scaling" call BIS_fnc_getParamValue);
_groups = ceil( _divider );
_size = _groups * 75;

_marker = [format["%1",random 9999], _pos, "ELLIPSE", [_size,_size] ] call CBA_fnc_createMarker;
//_marker setMarkerAlpha 0;

for "_i" from 1 to _groups do {
  _grp = [faction_side, random [4,6,8], ([_pos, 50, random 360] call BIS_fnc_relPos), faction_units] call SL_fnc_createGroup;
  nul = [leader _grp, _marker,"STAG COLUMN", "SAFE", "LIMITED","NOFOLLOW","RANDOM"] execVM "scripts\UPSMON.sqf";
};
