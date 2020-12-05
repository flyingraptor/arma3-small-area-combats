if(hasInterface) then {

	if(globCampingTimerEnabled == "1") then {

		private ["_player"];
		_player = _this select 0;

		_campSettingSeconds = parseNumber (globCampSettingSeconds);
		_campSettingMeters = parseNumber (globCampSettingMeters);

		_initialPos = getPos _player;
		_currentPos = _initialPos;

		_isHeCamping = {
			params ["_initialPos", "_currentPos"];
			_initialPos = _this select 0;
			_currentPos = _this select 1;
			_stillCamping = _currentPos inArea [_initialPos, _campSettingMeters, _campSettingMeters, 0, false];

			if(_stillCamping) then {
				true
			} else {
				false
			};
		};

		_currentCampSeconds = _campSettingSeconds + 2; // Plus 2 for accuracy in visual countdown

		if(!campingTimerInProgress) then {
			
			campingTimerInProgress = true;
			while {alive _player && globCampingTimerEnabled == "1"} do {

				sleep 1;
				_currentPos = getPos _player;
				_isCamping = [_initialPos, _currentPos] call _isHeCamping;

				if(_isCamping) then {

					_currentCampSeconds = _currentCampSeconds - 1;
					currentCampSecs = _currentCampSeconds;

					if(_currentCampSeconds == 0) then {

						campDeath = "";
						if(side _player == west) then {
							campDeath = "westCampDeath";
						};

						if(side _player == east) then {
							campDeath = "eastCampDeath";
						};
						_player setDamage 1; //Kill player because he is camping
						publicVariableServer "campDeath";
					}

				} else {
					_initialPos = getPos _player;
					_currentCampSeconds =_campSettingSeconds + 2;
				};
			};
		};
	};
};

