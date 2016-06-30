if !(local _this) exitWith {};

if ( missionNamespace getVariable ["ace_common", false] ) then {
  execVM "loadout\ace3\demspec.sqf";
} else {
  execVM "loadout\vanilla\demspec.sqf";
};
