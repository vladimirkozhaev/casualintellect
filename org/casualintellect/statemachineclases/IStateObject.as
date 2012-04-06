package org.casualintellect.statemachineclases
{
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public interface IStateObject 
	{
		function get state():String;
		function set state(val:String):void;
		
		function get className():String;
		
	}
	
}