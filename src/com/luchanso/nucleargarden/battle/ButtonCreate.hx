package com.luchanso.nucleargarden.battle;

import com.luchanso.nucleargarden.battle.units.GameShape;
import com.luchanso.nucleargarden.battle.units.ShapeType;
import flash.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ButtonCreate extends Sprite
{
	public var color : Int = 0x00D200;
	public var hoverColor : Int = 0x00C100;	
	public var shapeType : ShapeType;	
	public var size(get, set) : Float = 30;
	
	private var _color : Int;
	private var shape : GameShape;

	public function new(shapeType : ShapeType)
	{
		super();
		
		_color = color;
		
		this.shapeType = shapeType;		
		this.shape = generateShape(shapeType);
		
		this.addChild(shape);
		
		addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		
		draw();
	}
	
	private function generateShape(shapeType : ShapeType) 
	{
		var shape;
		
		if (shapeType == ShapeType.HQ) {
			shape = new GameShape();
		}

		this.shape.color = color;
		this.shape.x = this.size / 2 - shape.size / 2;
		this.shape.y = this.size / 2 - shape.size / 2;
		
		return shape;
	}
	
	private function mouseOut(e:MouseEvent):Void 
	{
		_color = color;
		draw();
	}
	
	private function mouseOver(e:MouseEvent):Void 
	{
		_color = hoverColor;
		draw();
	}
	
	private function draw()
	{
		graphics.clear();
		graphics.beginFill(0, 0);
		graphics.lineStyle(3, _color);
		graphics.moveTo(0, 0);
		graphics.lineTo(size, 0);
		graphics.lineTo(size, size);
		graphics.lineTo(0, size);
		graphics.lineTo(0, 0);
	}
	
	function get_size():Float 
	{
		return _size;
	}
	
	function set_size(value:Float):Float 
	{
		_size = value;
		draw();
		return _size;
	}
}