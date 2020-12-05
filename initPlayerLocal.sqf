"playAreaRadious" addPublicVariableEventHandler { playAreaRadious = _this select 1; };
"gameStarted" addPublicVariableEventHandler { gameStarted = _this select 1; };
"timeRemaining" addPublicVariableEventHandler { timeRemaining = _this select 1; };
"winKills" addPublicVariableEventHandler { winKills = _this select 1; };
"westScoreCount" addPublicVariableEventHandler { westScoreCount = _this select 1; };
"eastScoreCount" addPublicVariableEventHandler { eastScoreCount = _this select 1; };
"gameStarted" addPublicVariableEventHandler { gameStarted = _this select 1; };
"globCampSettingSeconds" addPublicVariableEventHandler { globCampSettingSeconds = _this select 1; };
"globCampSettingMeters" addPublicVariableEventHandler { globCampSettingMeters = _this select 1; };
"globCampingTimerEnabled" addPublicVariableEventHandler { globCampingTimerEnabled = _this select 1; };

campingTimerInProgress = false;
initiliazeTriggers = true;
moveInCombatArea = true;
