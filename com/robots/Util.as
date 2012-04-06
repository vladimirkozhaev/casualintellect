package com.robots 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class Util
	{
		
		public function Util() 
		{
			
		}
		
		public static function sign(val:Number):int {
			if (val>0) {
				return 1;
			}else if (val<0){
				return -1;
			}
			return 0;
		}
		
	}

}