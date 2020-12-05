if(isServer) then {
	_totalSeconds = winningOptionsArray select 0;
	_totalSecondsNum = parseNumber _totalSeconds;
	_counter = 0;

	while {_totalSecondsNum - _counter >= -1} do {
		sleep 1;
		secondsRemaing = _totalSecondsNum - _counter;
		_counter = _counter + 1;
	};
};