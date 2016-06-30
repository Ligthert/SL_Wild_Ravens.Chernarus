call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

// Global stuff.
mapSize = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
mapCenter = [mapSize/2,mapSize/2];

#include "enemyUnits.sqf";

// TODO: What about the HC slot?
if (isServer) then {
  execVM "genMissions.sqf";
};

/// TFR Settings:
// Frequencies and Channels:
tf_freq_west =    [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, nil, -1, 0];
tf_freq_west_lr = [0 ,7, ["41","42","43","44","45","46","47","48","49"],0, nil, -1, 0,true];
tf_freq_east  =   [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, nil, -1, 0];
tf_freq_east_lr = [0 ,7, ["41","42","43","44","45","46","47","48","49"],0, nil, -1, 0,true];
tf_freq_guer  =   [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, nil, -1, 0];
tf_freq_guer_lr = [0 ,7, ["41","42","43","44","45","46","47","48","49"],0, nil, -1, 0,true];

// Give radios some extra reach
TF_terrain_interception_coefficient = 0;

// Sync op radio frequencies
tf_same_sw_frequencies_for_side = true;
tf_same_lr_frequencies_for_side = true;

// Enables distribution of commander radios to squadmates.
TF_give_personal_radio_to_regular_soldier = true;

// Disable long range radios:
tf_no_auto_long_range_radio = true;


/// Scenario settings:

// Because we want to commit suicide
murshun_easywayout_canSuicide = true;

// Because we want to start with the weapon lowered
player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";

// Disable saving ever.
enableSaving [false, false];

// Fuck you
enableSentences false;

// [getMarkerPos "respawn", 5, random 360] call BIS_fnc_relPos;
