package com.robots.model 
{
	import com.robots.BeeConst;
	import com.robots.Util;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class SimpleBee extends GameObject implements IBee
	{
		
		public	static const CLASS_NAME = "simple_bee";
		
		/**
		 * In graduses
		 */
		
		private var _processedTower:ITower;
		
		
		public function SimpleBee() 
		{
			
		}
		
		/* INTERFACE com.robots.model.IBee */
		
		public function set processedTower(_processedTower:ITower):void {
			this._processedTower = _processedTower;
		}
		
		public  function get processedTower():ITower {
			
			return _processedTower;
		}
		
		public function move():void 
		{
			
			var angle:Number = Math.atan2(targetY - y, targetX - x);
			x = x + BeeConst.SHIFT_STEP_X * Math.cos(angle);
			y = y + BeeConst.SHIFT_STEP_Y * Math.sin(angle);
		}
		
		public function wait():void {
			trace("wait");
		}
		
		public function get className():String {
			return CLASS_NAME;
		}
		
		
		
	}

}