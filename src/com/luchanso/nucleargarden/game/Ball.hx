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
	public var color : Int = 0;
	public var size : Float = 0;
	
	/**
	 * Verticale speed
	 */
	private var vSpeed : Float = 0;
	private var debugInformation : TextField;
	
	static private var deltaAcceleration : Float = 0.13;
	
	public function new(isDebug : Bool = true)
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addToStage);
		
		if (isDebug) {
			debug();
		}
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
	
	private function debug()
	{
		debugInformation = new TextField();		
		debugInformation.text = "vP: " + this.y;
		debugInformation.textColor = 0xFFFFFF;
		debugInformation.autoSize = TextFieldAutoSize.LEFT;
		
		addChild(debugInformation);
	}
	
	public function vSpeedUp()
	{
		vSpeed -= deltaAcceleration;
	}
	
	public function vSpeedDown()
	{
		vSpeed += deltaAcceleration;
	}
	
	/* FloatERFACE com.luchanso.nucleargarden.game.GameObj */
	
	public function update(timeDelta:Float) 
	{
	    y += vSpeed * timeDelta;
		debugInformation.text = "y: " + this.y + " vA:" + this.vSpeed;
	}
}