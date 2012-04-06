package com.robots.model 
{
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public interface ITower extends IGameObject
	{
		function reparing():void;
		function get chargeLevel():int 
		function set chargeLevel(value:int):void	
		function set willBeCharged(value:Boolean):void;
		function get willBeCharged():Boolean;
	}
	
}