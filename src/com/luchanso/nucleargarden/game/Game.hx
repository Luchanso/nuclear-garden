package com.luchanso.nucleargarden.game;


import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.events.TimerEvent;
import openfl.Lib;
import openfl.ui.Keyboard;
import openfl.utils.Timer;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var timestep : Timestep;
	var playerBall : Ball;
	var platforms : List<Platform> = new List<Platform>();
	
	var platformDistanceMin : Float = 300;

	public function new()
	{
		super();
		
		timestep = new Timestep();
		timestep.gameSpeed = 0.5;
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}
	
	private function addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);		
		
		Lib.current.stage.addEventListener(MouseEvent.CLICK, tap);
		
		
		playerBall = new Ball();
		addChild(playerBall);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function tap(e:MouseEvent):Void 
	{
		playerBall.x = e.stageX - this.x;
		playerBall.y = e.stageY - this.y;
	}
	
	private function update(e:Event):Void
	{
		var timeDelta = timestep.tick();
		
		playerBall.update(timeDelta);
		this.x -= 2 * timeDelta;
	}
	
	private function checkDistanceForNewPlatform() {
		var platform = platforms.first();
		
		if (platform == null) {
			return true;
		} else {
			return getAbsolutleX(platform) < Lib.application.window.width - platformDistanceMin;
		}
	}
	
	private function clearScreen()
	{
		graphics.beginFill(0xFFFFFF);
		graphics.drawRect(0, 0, Lib.application.window.width, Lib.application.window.height);
		graphics.endFill();
	}
	
	private function generatePlatform() {
		var platform = new Platform();
		platform.x = -this.x + Lib.application.window.width;
		platform.y = Math.random() * (Lib.application.window.height - platform.platformSize);
		
		platforms.push(platform);
		
		return platform; 
	}
	
	private function getAbsolutleX(obj : DisplayObject) {
		return this.x + obj.x;
	}
}