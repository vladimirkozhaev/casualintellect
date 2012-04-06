package org.casualintellect.script 
{
	import flash.utils.Dictionary;
	/**
	 * Contain atom operations
	 * @author vkozhaev
	 */
	public class OperationsContainer
	{
		private var _container:Dictionary = new Dictionary();
		public function OperationsContainer() 
		{
		}
		
		public function testInit():void {
			var func1:Function = function() {
				return true;
			};
			
			var func2:Function = function() {
				return false;
			};
			
			var func3:Function = function() {
				return true;
			};
			
			var func4:Function = function() {
				return true;
			};
			
			addFunction("a", func1);
			addFunction("b",func2)
			addFunction("c", func3)
			addFunction("d", func4);
			
		}
		
		public function addFunction(functionName:String, func:Function):void {
			_container[functionName] = func;
		}
		
		public function functionByName(functionName:String):Function {
			var f:Function=_container[functionName]
			if (f == null) {
				trace("no elements for fName:",functionName);
				throw new NoSuchFunction(functionName)
			}
			return _container[functionName];
		}
		
		public function applyFuncToArgs(functionName:String, args:Array):Boolean {
			var f:Function = functionByName(functionName);
			return functionByName(functionName).apply(null, args);
		}
		
		
		
		
	}

}