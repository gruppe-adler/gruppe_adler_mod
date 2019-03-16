#include "IDCs.hpp"

#define GRID_W (pixelW * pixelGrid * 0.50)
#define GRID_H (pixelH * pixelGrid * 0.50)
#define X (((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * GRID_W)
#define Y (0.5 - (120 * 0.5 - 2 * 5) * GRID_H)

class DisplaySimulated;
class ctrlStaticBackgroundDisable;
class ctrlStaticBackgroundDisableTiles;
class ctrlStaticBackground;
class ctrlStaticFooter;
class ctrlStaticTitle;
class ctrlButtonOK;
class ctrlButtonCancel;
class ctrlStatic;
class ctrlEdit;
class ctrlCombo;
class ctrlCheckbox;

class GVAR(getUnitsLoadoutsGui): DisplaySimulated
{
	idd = -1;
	onLoad=QUOTE(_this call FUNC(onLoad));
	class controlsBackground
	{
		class BackgroundDisable: ctrlStaticBackgroundDisable
		{
		};
		class BackgroundDisableTiles: ctrlStaticBackgroundDisableTiles
		{
		};
		class Background: ctrlStaticBackground
		{
			x=X;
			y=Y;
			w=140 * GRID_W;
			h=(120 - 5 - 10) * GRID_H;
		};
		class BackgroundButtons: ctrlStaticFooter
		{
			x=((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * GRID_W;
			y=0.5 + (120 * 0.5 - 2 * 5 - 2) * GRID_H;
			w= 140 * GRID_W;
			h=(5 + 2) * GRID_H;
		};
	};
	class controls
	{

		class Title: ctrlStaticTitle
		{
			idc=24691;
			x=((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * GRID_W;
			y=0.5 - ( 120 * 0.5 - 	5) * GRID_H;
			w=140 * GRID_W;
			h=5 * GRID_H;
			text="Loadout Settings";
		};
		

		class NameText: ctrlStatic
		{
			x= X + GRID_W * 1;
			y= Y + GRID_H * 7;
			w= 34 * GRID_W;
			h= 5 * GRID_H;
			text="Name";
			style=1;
		};
		class Name: ctrlEdit
		{
			x= X + GRID_W * 37;
			y= Y + GRID_H * 7;
			w= 102 * GRID_W;
			h= 5 * GRID_H;
			idc= IDC_NAME;
		};

		class CfrText: ctrlStatic
		{
			x= X + GRID_W * 1;
			y= Y + GRID_H * 19;
			w= 34 * GRID_W;
			h= 5 * GRID_H;
			text="CFR Class";
			style=1;
		};
		class Cfr: ctrlCombo
		{
			x= X + GRID_W * 37;
			y= Y + GRID_H * 19;
			w= 102 * GRID_W;
			h= 5 * GRID_H;
			idc= IDC_CFR;
		};

		class SqlText: ctrlStatic
		{
			x= X + GRID_W * 1;
			y= Y + GRID_H * 25;
			w= 34 * GRID_W;
			h= 5 * GRID_H;
			text="SQL Class";
			style=1;
		};
		class Sql: ctrlCombo
		{
			x= X + GRID_W * 37;
			y= Y + GRID_H * 25;
			w= 102 * GRID_W;
			h= 5 * GRID_H;
			idc= IDC_SQL;
		};

		class PtlText: ctrlStatic
		{
			x= X + GRID_W * 1;
			y= Y + GRID_H * 31;
			w= 34 * GRID_W;
			h= 5 * GRID_H;
			text="PTL Class";
			style=1;
		};
		class Ptl: ctrlCombo
		{
			x= X + GRID_W * 37;
			y= Y + GRID_H * 31;
			w= 102 * GRID_W;
			h= 5 * GRID_H;
			idc= IDC_PTL;
		};

		class DefaultItemsText: ctrlStatic
		{
			x= X + GRID_W * 1;
			y= Y + GRID_H * 43;
			w= 34 * GRID_W;
			h= 5 * GRID_H;
			text="Default Items";
			style=1;
		};
		class DefaultItems: ctrlCheckbox
		{
			x= X + GRID_W * 37;
			y= Y + GRID_H * 43;
			w= 5 * GRID_W;
			h= 5 * GRID_H;
			idc= IDC_ITEMS;
		};


		class ButtonContinue: ctrlButtonOK
		{
			x=((getResolution select 2) * 0.5 * pixelW) + (140 * 0.5 - 55 - 2) * GRID_W;
			y=0.5 + ( 120 * 0.5 - 2 * 5 - 1) * GRID_H;
			w=30 * GRID_W;
			h=5 * GRID_H;
			onMouseButtonClick=QUOTE(_this call FUNC(onBtnOk));
		};
		class ButtonCancel: ctrlButtonCancel
		{
			x=((getResolution select 2) * 0.5 * pixelW) + (		140 * 0.5 - 25 - 1) * GRID_W;
			y=0.5 + (120 * 0.5 - 2 * 5 - 1) * GRID_H;
			w=25 * GRID_W;
			h=5 * GRID_H;
		};
	};
};