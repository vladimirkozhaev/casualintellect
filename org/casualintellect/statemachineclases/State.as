package org.casualintellect.statemachineclases 
{
	import flash.utils.Dictionary;
	/**
	 
	 * @author vkozhaev
	 */
	public class State
	{
		private  var _name:String="";
		private var _conditions:Dictionary = new Dictionary();
		private var _stateMethods:Dictionary = new Dictionary();
		
		
		public function State() 
		{
			
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get conditions():Dictionary 
		{
			return _conditions;
		}
		
		public function set conditions(value:Dictionary):void 
		{
			_conditions = value;
		}
		
		public function getMethods(methodsType:String):Vector.<String> {
			var methods:Vector.<String> = _stateMethods[methodsType];
			return methods;
		}
		
		public function setMethods(methodsType:String, methods:Vector.<String>):void {
			_stateMethods[methodsType]=methods;
		}
		
	}

}