/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
[[getPlayerUID _unit,_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;


if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[0,"STR_NOTF_Arrested_1",true, [_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;[[_unit,false,_time],"life_fnc_jail",_unit,false] call life_fnc_MP;