package com.luchanso.nucleargarden;

import com.luchanso.nucleargarden.battle.Game;
import openfl.display.Sprite;
import openfl.events.Event;

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
