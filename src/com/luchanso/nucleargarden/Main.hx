package com.luchanso.nucleargarden;

import com.luchanso.nucleargarden.game.Game;
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
	var game : Game;

	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		game = new Game();
		
		addChild(game);
	}

}
