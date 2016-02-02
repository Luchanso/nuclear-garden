package com.luchanso.nucleargarden.battle;
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
	
	public static function copy<T>( v:T ) : T  { 
		if (!Reflect.isObject(v)) { // simple type 
			return v; 
		}
		else if (Std.is(v, String)) { // string
			return v;
		}
		else if(Std.is( v, Array )) { // array 
			var result = Type.createInstance(Type.getClass(v), []); 
			untyped { 
				for( ii in 0...v.length ) {
					result.push(copy(v[ii]));
				}
			} 
			return result;
		}
		else if(Std.is( v, List )) { // list
			//List would be copied just fine without this special case, but I want to avoid going recursive
			var result = Type.createInstance(Type.getClass(v), []);
			untyped {
				var iter : Iterator<Dynamic> = v.iterator();
				for( ii in iter ) {
					result.add(ii);
				}
			} 
			return result; 
		}
		else if(Type.getClass(v) == null) { // anonymous object 
			var obj : Dynamic = {}; 
			for( ff in Reflect.fields(v) ) { 
				Reflect.setField(obj, ff, copy(Reflect.field(v, ff))); 
			}
			return obj; 
		} 
		else { // class 
			var obj = Type.createEmptyInstance(Type.getClass(v)); 
			for(ff in Reflect.fields(v)) {
				Reflect.setField(obj, ff, copy(Reflect.field(v, ff))); 
			}
			return obj; 
		} 
		return null; 
	}

}