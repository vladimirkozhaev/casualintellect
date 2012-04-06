package com.robots.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class GameEvent extends Event 
	{
		
		public static const UPDATE:String = "update";
		public static const TOWER_IS_CHARGED:String = "tower_is_charged";
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new GameEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GameEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}