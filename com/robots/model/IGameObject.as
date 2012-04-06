package com.robots.model 
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public interface IGameObject extends IEventDispatcher
	{
		function get stateName():String;
		function set stateName(val:String):void;
		function get ticks():int;
		function set ticks(val:int):void;
		function get x():Number;
		function set x(val:Number):void;
		function get y():Number;
		function set y(val:Number):void;		
	}
	
}