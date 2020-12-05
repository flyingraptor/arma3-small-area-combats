campingTimerInProgress = false;

player removeAction 0;
player addAction
[
	"Virtual Arsenal",	// title
	{
		["Open", true] spawn BIS_fnc_arsenal;
	},
	nil,		// arguments
	1.5,		// priority
	false,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

if(isServer && hasInterface) then
{
	if(!gameStarted) then {
		player removeAction 1;
		player addAction
		[
			"Small Area Combat",	// title
			{
				execVM "dialogGameSetupOpen.sqf";
			},
			nil,		// arguments
			1.5,		// priority
			false,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"true", 	// condition
			50,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		];
	};
};

player removeEventHandler ["Killed", 0];
player addEventHandler ["Killed", {

	_killer = _this select 1;

	if(side _killer == east) then {
		execVM "setWestRespawnPosition.sqf";
	};
	
	if(side _killer == west) then {
		execVM "setEastRespawnPosition.sqf";
	};
}];

player removeItem "itemGPS";
player addItem "itemGPS"; 
player assignItem "itemGPS";

[] spawn { [player] execVM 'handlerClient.sqf'; };