package com.robots.model 
{
	import org.casualintellect.statemachineclases.IStateObject;
	
	/**
	 * 
	 * @author vkozhaev
	 */
	public interface IBee extends IGameObject,IStateObject
	{
		
		
		function move():void;
		function get life():int;
		function set life(val:int):void;
		function set processedTower(tower:ITower):void;
		function get processedTower():ITower;		
		function get targetX():Number;
		function set targetX(val:Number):void;
		function get targetY():Number;
		function set targetY(val:Number):void;		
		function unloading():void;
		function wait():void;		
		
		
	}
	
}