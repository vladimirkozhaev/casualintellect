package org.casualintellect.script
{
	/**
	 * Contain 
	 * @author vkozhaev
	 */
	public class StringUtil
	{
		
		public function StringUtil() 
		{
			
		}
		/**
		 * Remove left spaces
		 * @param	str
		 * @return
		 */
		public static function ltrim(str:String):String {
			while (str.substr(0,1) == " " && str.length > 0) {
				str = str.substr(1,str.length-1);
			}
			return str;
		}
		
		/**
		 * Remove right spaces
		 * @param	str
		 * @return
		 */
		public static function rtrim(str:String):String {
			while (str.substr(str.length-1,str.length-1) == " " && str.length > 0) {
				str = str.substr(0, str.length - 1);
			
			}
			return str;
		}
		
		/**
		 * Remove all spaces
		 * @param	str
		 * @return
		 */
		public static function trim(str:String):String {
			return ltrim(rtrim(str));
		}
	}

}