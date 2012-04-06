package org.casualintellect.statemachineclases 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class TestStateObject implements IStateObject
	{
		public static const MOVING_TICKS:int = 10;
		private var _state:String;
		private var _movingTicks:int = 0;
		
		public function TestStateObject() 
		{
			
		}
		
		
		
		public function processMove():void {
			_movingTicks++;
		}
		
		
		/* INTERFACE org.casualintellect.statemachineclases.IStateObject */
		
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(val:String):void 
		{
			this._state = val;
		}
		
		public function get className():String 
		{
			return "className";
		}
		
		public function get movingTicks():int 
		{
			return _movingTicks;
		}
		
		public function set movingTicks(value:int):void 
		{
			_movingTicks = value;
		}
		
	}

}