package com.luchanso.nucleargarden.game;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
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
	var timer100ms : Timer;

	public function new() 
	{
		super();
		
		timestep = new Timestep();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);		
	}
	
	private function keyDown(e:KeyboardEvent):Void
	{
		if (e.keyCode == Keyboard.SPACE) {
			playerBall.vSpeedUp();
		}
		
		if (e.keyCode == Keyboard.R) {
			playerBall.y = Lib.application.window.height / 2 - playerBall.size / 2;
		}
	}
	
	private function addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		
		addEventListener(Event.ENTER_FRAME, update);		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		
		timer100ms = new Timer(100);
		timer100ms.addEventListener(TimerEvent.TIMER, timerTick);
		timer100ms.start();
		
		playerBall = new Ball();
		playerBall.size = 20;
		playerBall.color = 0xFF0000;
		playerBall.x = 100;
		playerBall.y = Lib.application.window.height / 2 - playerBall.size / 2;
		
		addChild(playerBall);		
	}
	
	private function timerTick(e:TimerEvent):Void 
	{
		playerBall.vSpeedDown();
	}
	
	private function update(e:Event):Void 
	{
		var timeDelta = timestep.tick();
		playerBall.update(timeDelta);
		
		if (playerBall.y > Lib.application.window.height) {
			playerBall.y = Lib.application.window.height / 2 - playerBall.size / 2;
		}
	}
	
	private function clearScreen()
	{
		graphics.beginFill(0xFFFFFF);
		graphics.drawRect(0, 0, Lib.application.window.width, Lib.application.window.height);
		graphics.endFill();
	}
}