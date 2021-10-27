class CloseAreaCombatDialog
{
	idd = 1234;
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by nikolas, v1.063, #Xuguhu)
		////////////////////////////////////////////////////////

		class baseFrame: RscFrame
		{
			idc = 1800;
			x = 0.304063 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.36800 * safezoneW;
			h = 0.490 * safezoneH;
		};
		class Back_IGUIBack {
			idc = -1;
			type = 0;
			text = "";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			style = 128;
			font = "puristaMedium";
			sizeEx = 0;
			shadow = 0;
			x = 0.304063 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.36800 * safezoneW;
			h = 0.490 * safezoneH;
		};
		class combatAreaDiameterText: RscText
		{
		  text = "Combat Area Diameter";
		  colorBackground[] = {0,0,0,0.5};
		  x = 0.328736 * safezoneW + safezoneX;
		  y = 0.289629 * safezoneH + safezoneY;
		  w = 0.154687 * safezoneW;
		  h = 0.028 * safezoneH;
		  colorText[] = {1,1,1,1};
		};
		class combatAreaDiameterList: RscListbox
		{
			idc = 1500;
			x = 0.328736 * safezoneW + safezoneX;
			y = 0.317629 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class timeOfDayText: RscText
		{
		  text = "Time of Day";
		  colorBackground[] = {0,0,0,0.5};
		  x = 0.49500 * safezoneW + safezoneX;
		  y = 0.289629 * safezoneH + safezoneY;
		  w = 0.154687 * safezoneW;
		  h = 0.028 * safezoneH;
		  colorText[] = {1,1,1,1};
		};
		class timeOfDayList: RscListbox
		{
			idc = 1501;
			text = $STR_A3__;
			x = 0.49500 * safezoneW + safezoneX;
			y = 0.317629 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class moveTimeLimitText: RscText
		{
		  text = "Prevent Player 'Camping'";
		  colorBackground[] = {0,0,0,0.5};
		  x = 0.328736 * safezoneW + safezoneX;
		  y = 0.47900 * safezoneH + safezoneY;
		  w = 0.154687 * safezoneW;
		  h = 0.028 * safezoneH;
		  colorText[] = {1,1,1,1};
		};
		class moveTimeLimitList: RscListbox
		{
			idc = 1502;
			x = 0.328812 * safezoneW + safezoneX;
			y = 0.50650 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class winConditionsText: RscText
		{
		  text = "Win Conditions";
		  colorBackground[] = {0,0,0,0.5};
		  x = 0.49500 * safezoneW + safezoneX;
		  y = 0.47900 * safezoneH + safezoneY;
		  w = 0.154687 * safezoneW;
		  h = 0.028 * safezoneH;
		  colorText[] = {1,1,1,1};
		};
		class winConditionsList: RscListbox
		{
			idc = 1503;
			x = 0.49500 * safezoneW + safezoneX;
			y = 0.50650 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class drawShapeOnMapBtn: RscButton
		{
			idc = 1600;
			text = "Draw Combat Area"; //--- ToDo: Localize;
			x = 0.418812 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.028 * safezoneH;
			action = "execVM 'mapDrawCustomArea.sqf'";
		};
		class playBtn: RscButton
		{
			idc = 1601;
			text = "Play"; //--- ToDo: Localize;
			x = 0.328812 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.028 * safezoneH;
			action = "execVM 'play.sqf'";
		}; 	
		/////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	}
};


