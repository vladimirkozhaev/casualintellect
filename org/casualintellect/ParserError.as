package org.casualintellect 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ParserError extends Error
	{
		
		public static const LEFT_BRACE_EXISTS:String = "left_brace_exists";
		public static const RIGHT_BRACE_EXISTS:String = "right_brace_exists";
		public static const NO_ENOUGH_ELEMENTS:String = "no_enough_elements";
		public static const INCORRECT_LENGHT_OF_STACK:String = "incorrect_len_of_stack";
		
		public function ParserError(message:* = "", id:* = 0) 
		{
			super(message, id);
			
		}
		
	}

}