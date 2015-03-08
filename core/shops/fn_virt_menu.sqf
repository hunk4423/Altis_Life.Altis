/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "copitems" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "med" && playerSide != independent) exitWith {hint localize "STR_NOTF_NotAMedic"};
if(_shop == "market" && life_D41_Karma < -4000) exitWith {hint format ["You do not have enough karma to buy in this market. Karma:% 1", life_D41_Karma];};
if(_shop == "fishmarket" && life_D41_Karma < -5000) exitWith {hint format ["You do not have enough karma to buy in this market. Karma:% 1", life_D41_Karma];};
if(_shop == "adac" && !license_med_adac && playerSide != independent) exitWith {hint format ["You are not ADAC staff"];};
if(_shop == "gunstore" && (life_D41_Karma <= -2000)) exitWith {hint format ["Your police file is too thick, here you get no weapons (Only Karma> -2000). Karma:% 1", life_D41_Karma];};
if(_shop == "rebel" && !license_civ_rebel) exitWith {hint format ["You are not a member of rebels."];};
if(_shop == "rebelnorth" && !license_civ_rebel) exitWith {hint format ["You are not a member of rebels."];};
if(_shop == "rebelsouth" && !license_civ_rebel) exitWith {hint format ["You are not a member of rebels."];};
if(_shop == "firmaitems" && !license_cop_gangfirma) exitWith {hint format ["You are not a company member."];};
if(_shop == "firmawaffen" && !license_cop_gangfirma) exitWith {hint format ["You are not a company member."];};
if(_shop == "firmapiloten" && !license_cop_gangfirma) exitWith {hint format ["You are not a company member."];};
if(_shop == "gangdmw" && !license_civ_gangdmw) exitWith {hint format ["You are not a member DMW."];};
if(_shop == "gangdmw_waffen" && !license_civ_gangdmw) exitWith {hint format ["You are not a member DMW."];};
if(_shop == "gangpow" && !license_civ_gangpow) exitWith {hint format ["You are not a member PowMia."];};
if(_shop == "gangpow_waffen" && !license_civ_gangpow) exitWith {hint format ["You are not a member PowMia."];};
if(_shop == "herowaffen" && !license_civ_gun) exitWith {hint format ["You have no gun license."];};
if(_shop == "leichtepistolen" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mittlerepistolen" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "schwerepistolen" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "pistolenattachments" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "leichtemps" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mittleremps" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "schweremps" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mpattachments" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sturmleicht" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sturmmittel" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sturmschwer" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sniperleicht" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "snipermittel" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sniperschwer" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mgleicht" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mgmittel" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mgschwer" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "rpg" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "schrot" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "sonstiges" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "schalli" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "llm" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "cqb" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "mid" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
if(_shop == "long" && playerSide != civilian && ((call life_adminlevel) > 2)) exitWith {hint format ["You're not a Civ or not a trusted weapons dealer."];};
createDialog "D41_Shop";

[] call life_fnc_virt_update;