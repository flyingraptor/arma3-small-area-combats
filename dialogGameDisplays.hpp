class RscTitles
{
	idd = 4321;

    class gameHud
    {
		idd = 1000000;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0;
        fadeout      =  0;
        name = "scoreHud";
		onLoad = "with uiNameSpace do { gameHud = _this select 0 }";
		class controls 
		{
			class westScoreText: RscText
			{
				idc = 1700;
				colorBackground[] = {0,0,1,0.5};
				x = safeZoneX + 0.40 * safeZoneW;
				y = safeZoneY + 0.93 * safeZoneH;
				w = 0.1;
				h = 0.1;
				colorText[] = {1,1,1,1};
				SizeEx = "0.1";
				style = ST_CENTER;
			};
			class gameWinCounterText: RscText
			{
				idc = 1701;
				colorBackground[] = {0,0,0,0.5};
				x = safeZoneX + 0.4510 * safeZoneW;
				y = safeZoneY + 0.93 * safeZoneH;
				w = 0.2;
				h = 0.1;
				colorText[] = {1,1,1,1};
				SizeEx = "0.1";
				style = ST_CENTER;
			};
			class eastScoreText: RscText
			{
				idc = 1702;
				colorBackground[] = {1,0,0,0.5};
				x = safeZoneX + 0.5435 * safeZoneW;
				y = safeZoneY + 0.93 * safeZoneH;
				w = 0.1;
				h = 0.1;
				colorText[] = {1,1,1,1};
				SizeEx = "0.1";
				style = ST_CENTER;
			};
		};
	};
	class campHud
    {
		idd = 1000001;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0;
        fadeout      =  0;
        name = "campHud";
		onLoad = "with uiNameSpace do { campHud = _this select 0 }";
		class controls 
		{
			class playerCampingInfoText: RscText
			{
				idc = 1703;
				colorBackground[] = {0.2,1,0.6,0.5};
				x = safeZoneX + 0.10 * safeZoneW;
				y = safeZoneY + 0.93 * safeZoneH;
				w = 0.4;
				h = 0.1;
				colorText[] = {1,1,1,1};
				SizeEx = "0.05";
				style = ST_CENTER;
			};
		};
	};
	class outOfZoneHud
    {
		idd = 1000002;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  7;
        fadein       =  0;
        fadeout      =  0;
        name = "outOfZoneHud";
		onLoad = "with uiNameSpace do { outOfZoneHud = _this select 0 }";
		class controls 
		{
			class playerCampingInfoText: RscText
			{
				idc = 1704;
				colorBackground[] = {1,0,0,0.5};
				x = safeZoneX + 0.4510 * safeZoneW;
				y = safeZoneY + 0.30 * safeZoneH;
				w = 0.4;
				h = 0.1;
				colorText[] = {1,1,1,1};
				SizeEx = "0.05";
				style = ST_CENTER;
			};
		};
	};
};