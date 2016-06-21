// Header stuff

// Obligatory private
private ["_marker"];

// Where do we want it
_pos = _this select 0;

_grp = createGroup EAST;

/////////// MAGIC ///////////

// Deploy composition.
[_pos,comp_camps call BIS_fnc_selectRandom] call SL_fnc_loadCompositions;

// Place some objects that need fucking up
_tgt = _grp createUnit [faction_officers call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

/////////// MAGIC ///////////

// Create Marker of the search area
// SL_fnc_createMarker
_marker = [_pos] call SL_fnc_createMarker;

// Create Task and spam to clients

// Wait until shits stolen, dead or destroyed
waitUntil {!alive _tgt};

// Add some sleep to keep the players in suspension.
sleep (random 10);

// Mark the task as done


// Destroy marker
deleteMarker _marker;
