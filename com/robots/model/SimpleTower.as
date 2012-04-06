package com.robots.model 
{
	import com.robots.BeeConst;
	import com.robots.events.GameEvent;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class SimpleTower extends GameObject implements ITower
	{
		
	
		private var _chargeLevel:int=0;
		private var _willBeCharged:Boolean = false;
		
		public function SimpleTower() 
		{
			
		}
		
		/* INTERFACE com.robots.model.ITower */
		
		
		
		public function get chargeLevel():int 
		{
			return _chargeLevel;
		}
		
		public function set chargeLevel(value:int):void 
		{
			_chargeLevel = value;
		}
		
		public function reparing():void {
			
			chargeLevel++;
			if (chargeLevel > BeeConst.LOW_ENERGY_LEVEL) {
				this.dispatchEvent(new GameEvent(GameEvent.TOWER_IS_CHARGED));
			}
		}
		
		public function set willBeCharged(value:Boolean):void {
			this._willBeCharged = value;
		}
		
		public function get willBeCharged():Boolean {
			return _willBeCharged;
		}
		
		
	}

}