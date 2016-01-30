package com.luchanso.nucleargarden.game;


import flash.text.TextField;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextFieldAutoSize;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Ball extends Sprite implements GameObj
{	
	private var color : Int = 0xFF0006;
	private var size : Float = 30;
	
	/**
	 * Verticale speed
	 */
	private var debugInformation : TextField;
	
	public function new()
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addToStage);
	}
	
	private function addToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addToStage);
		
		draw();
	}
	
	private function draw()
	{
		graphics.beginFill(color);
		graphics.drawCircle(0, 0, size);
		graphics.endFill();
	}
	
	/* FloatERFACE com.luchanso.nucleargarden.game.GameObj */
	
	public function update(timeDelta:Float) 
	{	    
		
	}
}