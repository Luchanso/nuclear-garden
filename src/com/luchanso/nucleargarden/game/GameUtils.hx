package com.luchanso.nucleargarden.game;
import openfl.geom.Point;

/**
 * ...
 * @author Loutchansky Oleg
 */
class GameUtils
{
	/**
	 * Convert point to degrees 0 - 180
	 */
	public static function convertPointToDeg(x1 : Float, y1 : Float, x2 : Float, y2 : Float) : Float
	{
		return Math.atan2(y1 - y2, x1 - x2) * 180 / Math.PI;
	}
	
	/**
	 * Convert point degrees to once point
	 */
	public static function convertDegToPoint(legnth : Float, degrees : Float) : Point
	{
		return Point.polar(legnth, degrees * (Math.PI / 180));
	}
}