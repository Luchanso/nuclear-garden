package com.luchanso.nucleargarden.game;

import flash.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Platform extends Sprite
{
	public var platformSize : Float;

	public function new() 
	{
		super();
		
		platformSize = 50 + Math.random() * 30;
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		
		draw();
	}
	
	private function draw()
	{
		graphics.beginFill(0xFFFFFF);
		graphics.drawRect(0, 0, platformSize, platformSize);
		graphics.endFill();
	}
	
}