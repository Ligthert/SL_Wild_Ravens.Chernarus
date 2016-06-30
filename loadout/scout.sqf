if !(local _this) exitWith {};

if ( missionNamespace getVariable ["ace_common", false] ) then {
  execVM "loadout\ace3\scout.sqf";
} else {
  execVM "loadout\vanilla\scout.sqf";
};
