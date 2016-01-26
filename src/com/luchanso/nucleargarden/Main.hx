package com.luchanso.nucleargarden;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Main extends Sprite 
{
	var test : BitmapData;
	var testDip : Bitmap;

	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		var winWidth = Lib.application.window.width;
		var winHeight = Lib.application.window.height;
		
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		
		graphics.beginFill(0xffffff);
		graphics.drawRect(0, 0, winWidth, winHeight);
		graphics.endFill();
		
		test = openfl.Assets.getBitmapData("img/test.jpg");
		testDip = new Bitmap(test);
		testDip.x = winWidth / 2 - testDip.width / 2;
		testDip.y = winHeight / 2 - testDip.height / 2;
		
		addChild(testDip);
	}

}
