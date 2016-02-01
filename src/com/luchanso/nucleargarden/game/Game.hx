package com.luchanso.nucleargarden.game;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.FPS;
import openfl.Lib;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var timestep : Timestep;
	var fps : FPS;
	var shapes = new List<GameShape>();

	public function new()
	{
		super();
		
		timestep = new Timestep();
		timestep.gameSpeed = 1;
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);		
		
		fps = new FPS(10, 10, 0xFFFFFF);
		addChild(fps);
		
		for (i in 0...100)
		{
			var shape = new GameShape();
			shape.color = 0xAAAAAA + Math.round(Math.random() * 0x666666);
			shape.x = Math.random() * Lib.application.window.width;
			shape.y = Math.random() * Lib.application.window.height;
			
			shape.speed = Math.random() * 3;
			
			shapes.push(shape);
			addChild(shape);
		}

		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void 
	{
		var timeDelta = timestep.tick();

		for (shape in shapes) 
		{
			if (Math.random() < 0.1) {
				shape.speed = Math.random() * 3;
			}
			shape.rotation = GameUtils.convertPointToDeg(mouseX, mouseY, shape.centerX, shape.centerY);
			shape.update(timeDelta);
		}
	}
}