package com.luchanso.nucleargarden.game;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Point;

/**
 * ...
 * @author Loutchansky Oleg
 */
class GameShape extends Sprite implements GameObj
{
	public var color : Int = 0xFF0000;
	public var size : Float = 15;
	public var speed : Float = 15;
	public var t : Float = 0;
	
	public var centerX(get, null) : Float;
	public var centerY(get, null) : Float;

	public function new()
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		
		draw();
	}
	
	private function draw()
	{		
		graphics.lineStyle(3, color);
		graphics.moveTo(0, 0);
		graphics.lineTo(size, size / 2);
		graphics.lineTo(0, size);
	}
	
	/* INTERFACE com.luchanso.nucleargarden.game.GameObj */
	
	public function update(timeDelta:Float):Void 
	{
		var point = GameUtils.convertDegToPoint(speed * timeDelta, rotation);
		x += point.x;
		y += point.y;
	}
	
	function get_centerX():Float 
	{
		return x + size / 2;
	}
	
	function get_centerY():Float 
	{
		return y + size / 2;
	}
}