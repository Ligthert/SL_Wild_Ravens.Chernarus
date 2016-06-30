comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "U_B_CombatUniform_mcam_worn";
for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
player addVest "V_TacVest_oli";
player addItemToVest "SmokeShell";
player addItemToVest "HandGrenade";
for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 3 do {player addItemToVest "16Rnd_9x21_Mag";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
player addItemToBackpack "Medikit";
player addItemToBackpack "Chemlight_green";
for "_i" from 1 to 2 do {player addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_65x39_caseless_mag_Tracer";};
player addHeadgear "H_HelmetB_snakeskin";
player addGoggles "G_Balaclava_oli";

comment "Add weapons";
player addWeapon "arifle_MX_Black_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addPrimaryWeaponItem "bipod_01_F_blk";
player addWeapon "hgun_P07_F";
player addHandgunItem "muzzle_snds_L";
player addWeapon "Binocular";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_OPFOR";

comment "Set identity";
[player,"MANW"] call bis_fnc_setUnitInsignia;
