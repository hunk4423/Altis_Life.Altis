/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "Life_Clothing";
disableSerialization;

//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","reb","kart","work","luxus"] && playerSide != civilian) exitWith {hint "Du musst Zivilst sein um diesen Shop nutzen zu können!"; closeDialog 0;};
if((_this select 3) == "rebnorth" && !license_civ_rebel) exitWith {hint "Du hast noch kein Rebellentraining!"; closeDialog 0;};
if((_this select 3) == "rebsouth" && !license_civ_rebel) exitWith {hint "Du hast noch kein Rebellentraining!"; closeDialog 0;};
if((_this select 3) in ["cop"] && playerSide != west) exitWith {hint "Du musst Polizist sein um den Shop nutzen zu können!"; closeDialog 0;};
if((_this select 3) in ["med"] && playerSide != independent) exitWith {hint "Du musst Sanitäter sein um den Shop nutzen zu können!"; closeDialog 0;};
if((_this select 3) in ["dive"] && !license_civ_dive) exitWith { hint "Du brauchst eine Taucherlizenz für diesen Shop!"; closeDialog 0;};
if((_this select 3) in ["adac"] && playerSide != independent) exitWith { hint "Du bist kein ADAC-Mitarbeiter!"; closeDialog 0;};
if((_this select 3) in ["gangdmw"] && !license_civ_gangdmw) exitWith { hint "Du bist nicht Mitglied bei Dead Men Walking!"; closeDialog 0;};
if((_this select 3) in ["gangrr"] && !license_civ_gangrr) exitWith { hint "Du bist nicht Mitglied bei RR!"; closeDialog 0;};
if((_this select 3) in ["gangpow"] && !license_civ_gangpow) exitWith { hint "Du bist nicht Mitglied bei PowMia!"; closeDialog 0;};
if((_this select 3) in ["ganglast"] && !license_civ_ganglast) exitWith { hint "Du bist nicht Mitglied bei LAST!"; closeDialog 0;};
if((_this select 3) in ["gangfirma"] && !license_cop_gangfirma) exitWith { hint "Du bist nicht Mitglied bei Die Firma!"; closeDialog 0;};
if((_this select 3) in ["hero"] && (life_D41_Karma <= 1999)) exitWith { hint "Du hast zu wenig Karma um hier einkaufen zu können!"; closeDialog 0;};

life_clothing_store = _this select 3;

//License Check?
_var = [life_clothing_store,0] call life_fnc_licenseType;
if(_var select 0 != "") then
{
	if(!(missionNamespace getVariable (_var select 0))) exitWith {hint format[localize "STR_Shop_YouNeed",[_var select 0] call life_fnc_varToStr]; closeDialog 0;};
};

//initialize camera view
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

waitUntil {isNull (findDisplay 3100)};
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if(isNil "life_clothesPurchased") exitWith
{
	life_clothing_purchase = [-1,-1,-1,-1,-1];
	if(life_oldClothes != "") then {player addUniform life_oldClothes;} else {removeUniform player};
	if(life_oldHat != "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
	if(life_oldGlasses != "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then
	{
		if(life_oldBackpack == "") then
		{
			removeBackpack player;
		}
			else
		{
			removeBackpack player;
			player addBackpack life_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count life_oldBackpackItems > 0) then
			{
				{
					[_x,true,true] call life_fnc_handleItem;
				} foreach life_oldBackpackItems;
			};
		};
	};
	
	if(count life_oldUniformItems > 0) then
	{
		{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldUniformItems;
	};
	
	if(vest player != "") then
	{
		if(life_oldVest == "") then
		{
			removeVest player;
		}
			else
		{
			player addVest life_oldVest;
			if(count life_oldVestItems > 0) then
			{
				{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
			};
		};
	};
};
life_clothesPurchased = nil;

//Check uniform purchase.
if((life_clothing_purchase select 0) == -1) then
{
	if(life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if((life_clothing_purchase select 1) == -1) then
{
	if(life_oldHat != headgear player) then {if(life_oldHat == "") then {removeHeadGear player;} else {player addHeadGear life_oldHat;};};
};
//Check glasses
if((life_clothing_purchase select 2) == -1) then
{
	if(life_oldGlasses != goggles player) then
	{
		if(life_oldGlasses == "") then 
		{
			removeGoggles player;
		}
			else
		{
			player addGoggles life_oldGlasses;
		};
	};
};
//Check Vest
if((life_clothing_purchase select 3) == -1) then
{
	if(life_oldVest != vest player) then
	{
		if(life_oldVest == "") then {removeVest player;} else
		{
			player addVest life_oldVest;
			{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
		};
	};
};

//Check Backpack
if((life_clothing_purchase select 4) == -1) then
{
	if(life_oldBackpack != backpack player) then
	{
		if(life_oldBackpack == "") then {removeBackpack player;} else
		{
			removeBackpack player;
			player addBackpack life_oldBackpack;
			{[_x,true,true] call life_fnc_handleItem;} foreach life_oldBackpackItems;
		};
	};
};

life_clothing_purchase = [-1,-1,-1,-1,-1];

[] call life_fnc_saveGear;