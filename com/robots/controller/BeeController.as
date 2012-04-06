package com.robots.controller 
{
	import com.robots.BeeConst;
	import com.robots.model.Gameboard;
	import com.robots.model.IBee;
	import com.robots.model.ITower;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class BeeController
	{
		private static const _beeConditionsChecker:BeeController = new BeeController();
		
		private var _gameboard:Gameboard;
		
		
		public function BeeController() 
		{
			
		}
		
		
		static public function get instance():BeeController 
		{
			return _beeConditionsChecker;
		}		
		
		public function get gameboard():Gameboard 
		{
			return _gameboard;
		}
		
		public function set gameboard(value:Gameboard):void 
		{
			_gameboard = value;
		}
		
		public function endMoveCondition(bee:IBee):Boolean {
			return (Math.abs(bee.x - bee.targetX) < BeeConst.SHIFT_STEP_X && 
			Math.abs(bee.y - bee.targetY) < BeeConst.SHIFT_STEP_Y);			
		}
		
		public function endUnloading(bee:IBee):Boolean {
			
			return bee.ticks>=BeeConst.UNLOADING_TIME;
		}
		
		public function endWating(bee:IBee):void {
			trace("---------- endWating ----------------------");
		}
		
		public function endCharging(bee:IBee):Boolean {
			//trace("end charging is:",bee.ticks>=BeeConst.CHARGING_TIME);
			return bee.ticks>=BeeConst.CHARGING_TIME;
		}
		
		public function move(bee:IBee):void {
			bee.move();
		}	
		
		public function wait(bee:IBee):void {
			bee.ticks++;
			if (bee.processedTower != null) {
				bee.processedTower.reparing();
			}
			
		}
		
		public function beforeMoving(bee:IBee):void {
			bee.ticks = 0;
			var unchargedTowers:Vector.<ITower> = _gameboard.unchargedTowers;
			if (unchargedTowers.length==0) {
				return;
			}
			
			var _targetTower:ITower = unchargedTowers[0];
						
			bee.targetX = _targetTower.x;
			bee.targetY = _targetTower.y;
			bee.processedTower = _targetTower;		
			_targetTower.willBeCharged = true;
		}
		
		public function afterMoving(bee:IBee):void {
			bee.ticks = 0;
		}
		
		public function beforeCharging(bee:IBee):void {
			bee.ticks = 0;
		}
		
		public function charge(bee:IBee):void {
			
			if (bee.processedTower != null) {
				bee.processedTower.reparing();
			}
			bee.ticks++;
		}	
		
		public function watingIsFinished(bee:IBee):Boolean {
			return bee.ticks >= BeeConst.WATING_TICKS;
		}
		
		public function beforeWating(bee:IBee):void {
			trace("before wating");
		}
		
		public function afterWating(bee:IBee):void {
			
			
			if (bee.processedTower != null) {
				bee.processedTower.willBeCharged = false;
			}
			bee.processedTower = null;
		}
		
		public function needRepairTower(bee:IBee):Boolean {
			return true;
		}
		
		public function endMoving(bee:IBee):void {			
			bee.x = bee.targetX;
			bee.y = bee.targetY;
			
		}
		
		public function energyIsLow(bee:IBee):Boolean {
			return false;
		}
		
		public function goalIsGetted(bee:IBee):Boolean {
			return (Math.abs(bee.x-bee.targetX)<=BeeConst.SHIFT_STEP_X)&&(Math.abs(bee.y-bee.targetY)<=BeeConst.SHIFT_STEP_Y)
		}
		
		public function hasNotChargedTowers(bee:IBee):Boolean {
			if (_gameboard.unchargedTowers.length == 0) {			
				return false;
			}		
			
			return true;
		}
		
	}

}