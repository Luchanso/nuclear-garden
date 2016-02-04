package com.luchanso.nucleargarden.battle;


import com.luchanso.nucleargarden.battle.units.GameShape;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.FPS;
import openfl.events.MouseEvent;
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
	
	var buttonList = new List<ButtonCreate>();

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
		
		addFPS();		
		addButtons();
		
		/*for (i in 0...100)
		{
			var shape = new GameShape();
			shape.color = 0x00FF00;
			shape.x = Math.random() * Lib.application.window.width;
			shape.y = Math.random() * Lib.application.window.height;
			
			shape.speed = Math.random() * 3;
			
			shapes.push(shape);
			addChild(shape);
		}*/

		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void 
	{
		var timeDelta = timestep.tick();

		/*for (shape in shapes) 
		{
			if (Math.random() < 0.1) {
				shape.speed = Math.random() * 3;
			}
			shape.rotation = GameUtils.convertPointToDeg(mouseX, mouseY, shape.centerX, shape.centerY);
			shape.update(timeDelta);
		}*/
	}
	
	private function addButtons()
	{
		var shipHQ = new GameShape();
		var shipQS = new GameShape();
		var shipSH = new GameShape();
		
		var buttonHQ = new ButtonCreate(shipHQ);
		/*buttonHQ.addEventListener(MouseEvent.CLICK, createHQ);
		buttonHQ.size = Lib.application.window.height / 4;
		buttonHQ.x = 0;
		buttonHQ.y = 0;*/
		
		var buttonQS = new ButtonCreate(shipQS);
		/*buttonSQ.size = Lib.application.window.height / 4;
		buttonQS.x = 0;
		buttonQS.y = 150;*/
		
		var buttonSH = new ButtonCreate(shipSH);
		/*buttonSH.size = Lib.application.window.height / 4;
		buttonSH.x = 50;
		buttonSH.y = 250;*/
		
		addChild(buttonHQ);
		addChild(buttonQS);
		addChild(buttonSH);
	}
	
	private function createHQ(e:MouseEvent):Void 
	{
		for (i in 0...5) 
		{		
			var shape = new GameShape();
			shape.color = 0x00DD00;
			shape.x = 100 + Math.random() * 50;
			shape.y = Lib.application.window.height / 2 + Math.random() * 50;
			
			shapes.push(shape);
			addChild(shape);	
		}
	}
	
	private function addFPS()
	{
		fps = new FPS(10, 10, 0xFFFFFF);
		addChild(fps);
	}
	
	
}