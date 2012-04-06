package org.casualintellect.statemachineclases 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class Roole
	{
		private var _reversePolishNotation:Array;
		
		public function Roole() 
		{
			
		}
		
		public function get reversePolishNotation():Array 
		{
			return _reversePolishNotation.concat();
		}
		
		public function set reversePolishNotation(value:Array):void 
		{
			_reversePolishNotation = value;
		}
		
	}

}