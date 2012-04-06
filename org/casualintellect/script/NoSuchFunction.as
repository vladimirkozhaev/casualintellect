package org.casualintellect.script 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class NoSuchFunction extends Error 
	{
		public static const NO_SUCH_FUNCTION_ERROR:String = "no_such_function"
		private var _functionName:String;
		public function NoSuchFunction(_functionName:String) 
		{ 
			super(NO_SUCH_FUNCTION_ERROR);
			this._functionName = _functionName;
		} 
		
		public function get functionName():String 
		{
			return _functionName;
		}
		
		
	}
	
}