package org.casualintellect.statemachineclases 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class UseCase
	{
		private var _functions:Vector.<String>
		private var _newStateName:String;
		private var _roole:Roole;
		
		
		public function UseCase() 
		{
			
		}
		
		public function get functions():Vector.<String> 
		{
			return _functions;
		}
		
		public function set functions(value:Vector.<String>):void 
		{
			_functions = value;
		}
		
		public function get newStateName():String 
		{
			return _newStateName;
		}
		
		public function set newStateName(value:String):void 
		{
			_newStateName = value;
		}
		
		public function get roole():Roole 
		{
			return _roole;
		}
		
		public function set roole(value:Roole):void 
		{
			_roole = value;
		}
		
	}

}