// faction: OPF_F
opf_f_units = ["O_Soldier_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_Soldier_repair_F","O_Soldier_exp_F","O_Soldier_A_F","O_Soldier_AA_F","O_engineer_F"];
opf_f_officers = ["O_officer_F"];
opf_f_ammo = ["Box_East_Ammo_F","Box_East_Wps_F","Box_East_Grenades_F","Box_East_Support_F"];
opf_f_aa = ["O_static_AA_F"];
opf_f_at = ["O_static_AT_F"];
opf_f_mortar = ["O_Mortar_01_F"];

// faction: OPF_G_F
opf_g_f_units = ["O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F"];
opf_g_f_officers = ["O_G_officer_F"];
opf_g_f_ammo = ["Box_FIA_Ammo_F","Box_FIA_Wps_F","Box_FIA_Support_F"];
opf_g_f_aa = ["O_static_AA_F"];
opf_g_f_at = ["O_static_AT_F"];
opf_g_f_mortar = ["O_G_Mortar_01_F"];

// faction: IND_F
ind_f_units = ["I_Soldier_A_F","I_soldier_AR_F","I_medic_F","I_engineer_F","I_soldier_exp_F","I_Soldier_GL_F","I_soldier_M_F","I_soldier_AA_F","I_soldier_AT_F","I_officer_F","I_soldier_repair_F","I_Soldier_F","I_soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F"];
ind_f_officers = ["I_officer_F","I_Story_Colonel_F"];
ind_f_ammo = ["Box_IND_Ammo_F","Box_IND_Wps_F","Box_IND_Grenades_F","Box_IND_Support_F"];
ind_f_aa = ["I_static_AA_F"];
ind_f_at = ["I_static_AT_F"];
ind_f_mortar = ["I_G_Mortar_01_F"];

// faction: IND_G_F
ind_g_f_units = ["I_G_Soldier_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F"];
ind_g_f_officers = ["I_G_officer_F"];
ind_g_f_ammo = ["Box_FIA_Ammo_F","Box_FIA_Wps_F","Box_FIA_Support_F"];
ind_g_f_aa = ["I_static_AA_F"];
ind_g_f_at = ["I_static_AT_F"];
ind_g_f_mortar = ["I_G_Mortar_01_F"];

if ("param_enemy_faction" call BIS_fnc_getParamValue == 1) then {
  faction_units = opf_f_units;
  faction_officers = opf_f_officers;
  faction_side = east;
  faction_ammo = opf_f_ammo;
  faction_aa = opf_f_aa;
  faction_at = opf_f_at;
  faction_mortar = opf_f_mortar;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 2) then {
  faction_units = opf_g_f_units;
  faction_officers = opf_g_f_officers;
  faction_side = east;
  faction_ammo = opf_g_f_ammo;
  faction_aa = opf_g_f_aa;
  faction_at = opf_g_f_at;
  faction_mortar = opf_g_f_mortar;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 3) then {
  faction_units = ind_f_units;
  faction_officers = ind_f_officers;
  faction_side = independent;
  faction_ammo = ind_f_ammo;
  faction_aa = ind_f_aa;
  faction_at = ind_f_at;
  faction_mortar = ind_f_mortar;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 4) then {
  faction_units = ind_g_f_units;
  faction_officers = ind_g_f_officers;
  faction_side = independent;
  faction_ammo = ind_g_f_ammo;
  faction_aa = ind_g_f_aa;
  faction_at = ind_g_f_at;
  faction_mortar = ind_g_f_mortar;
};
