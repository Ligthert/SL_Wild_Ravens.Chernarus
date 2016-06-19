_pos = _this select 0;

// Replace with UPSMON patrols that scale to the amount of players.

// 100
_grp = [faction_side, 8, ([_pos, 50, random 360] call BIS_fnc_relPos), faction_units] call SL_fnc_createGroup;
[_grp, _pos, 50, 12, "MOVE", "SAFE", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;

sleep 5;

// 200
_grp = [faction_side, 4, ([_pos, 200, random 360] call BIS_fnc_relPos), faction_units] call SL_fnc_createGroup;
[_grp, _pos, 200, 24, "MOVE", "STEALTH", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;

sleep 5;

// 300
_grp = [faction_side, 4, ([_pos, 350, random 360] call BIS_fnc_relPos), faction_units] call SL_fnc_createGroup;
[_grp, _pos, 300, 36, "MOVE", "SAFE", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;

sleep 5;
