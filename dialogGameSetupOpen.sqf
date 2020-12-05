createDialog "CloseAreaCombatDialog";

/* Initialize Area Diameter List */
_diameterList = ["100 meters", "200 meters", "300 meters"];
_radiousList = ["50", "100", "150"];
_ctrlCombatAreaSizeList = (findDisplay 1234) displayCtrl 1500;
{
	_ctrlCombatAreaSizeList lbAdd _x;
	_ctrlCombatAreaSizeList lbSetData [_forEachIndex, _radiousList select _forEachIndex];
} forEach _diameterList;

if(isNil "lastSelectedIndex") then {
	_ctrlCombatAreaSizeList lbSetCurSel 0;
} else {
	_ctrlCombatAreaSizeList lbSetCurSel lastSelectedIndex;
};

ctrlEnable [1500, true];

// Initialize Time of Day List
_timeOfDayList = ["Dawn", "Morning", "Noon", "Afternoon", "Dusk", "Night"];
_timeOfDayUsefulList = ["4:20", "7:0", "14:0", "19:0", "20:00", "0:0"];
_ctrlTimeOfDayList = (findDisplay 1234) displayCtrl 1501;
{
	_ctrlTimeOfDayList lbAdd _x;
	_ctrlTimeOfDayList lbSetData [_forEachIndex, _timeOfDayUsefulList select _forEachIndex];
} forEach _timeOfDayList;

_ctrlTimeOfDayList ctrlAddEventHandler ["LBSelChanged", {
	lastTimeOfDayIndex = lbCurSel (_this select 0);
	_ctrlTimeOfDayList lbSetCurSel lastTimeOfDayIndex;
}];


if(isNil "lastTimeOfDayIndex") then {
	_ctrlTimeOfDayList lbSetCurSel 3;
} else {
	_ctrlTimeOfDayList lbSetCurSel lastTimeOfDayIndex;
};

ctrlEnable [1501, true];

// Initialize Move Time Limit List
_metersPerTime = ["Disabled", "30 seconds to move 20 meters", "1 minutes to move 20 meters", "2 minutes to move 20 meters", "3 minutes to move 20 meters"];
_metersPerTimeUsefulList = ["disabled", "30,20", "60,20", "120,20", "180,20"];
_ctrlMoveTimeLimitList = (findDisplay 1234) displayCtrl 1502;
{
	_ctrlMoveTimeLimitList lbAdd _x;
	_ctrlMoveTimeLimitList lbSetData [_forEachIndex, _metersPerTimeUsefulList select _forEachIndex];
} forEach _metersPerTime;

_ctrlMoveTimeLimitList ctrlAddEventHandler ["LBSelChanged", {
	lastMoveTimeLimitIndex = lbCurSel (_this select 0);
	_ctrlMoveTimeLimitList lbSetCurSel lastMoveTimeLimitIndex;
}];

if(isNil "lastMoveTimeLimitIndex") then {
	_ctrlMoveTimeLimitList lbSetCurSel 0;
} else {
	_ctrlMoveTimeLimitList lbSetCurSel lastMoveTimeLimitIndex;
};

ctrlEnable [1502, true];

// Initialize Win Conditions List
_winConditions = ["First reaches 10 kills", "First reaches 30 kills", "First reaches 50 kills", "Most kills in 10 minutes", "Most kills in 30 minutes", "Most kills in 60 minutes"];
_winConditionsUsefulList = ["10,KILL_COUNT", "30,KILL_COUNT", "50,KILL_COUNT", "600,SECONDS_COUNT", "1800,SECONDS_COUNT", "3600,SECONDS_COUNT"];
_ctrlWinConditionsList = (findDisplay 1234) displayCtrl 1503;
{
	_ctrlWinConditionsList lbAdd _x;
	_ctrlWinConditionsList lbSetData [_forEachIndex, _winConditionsUsefulList select _forEachIndex];
} forEach _winConditions;

_ctrlWinConditionsList ctrlAddEventHandler ["LBSelChanged", {
	ctrlWinConditionsIndex = lbCurSel (_this select 0);
	_ctrlWinConditionsList lbSetCurSel ctrlWinConditionsIndex;
}];

if(isNil "ctrlWinConditionsIndex") then {
	_ctrlWinConditionsList lbSetCurSel 0;
} else {
	_ctrlWinConditionsList lbSetCurSel ctrlWinConditionsIndex;
};
ctrlEnable [1503, true];

