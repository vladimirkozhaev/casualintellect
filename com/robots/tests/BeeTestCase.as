package com.robots.tests 
{
	import asunit.framework.TestCase;
	import com.robots.BeeConst;
	import com.robots.controller.BeeController;
	import com.robots.model.IBee;
	import com.robots.model.SimpleBee;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class BeeTestCase extends TestCase
	{
		
		var _beeConditionsChecker:BeeController=BeeController.instance;
		public function BeeTestCase(testMethod:String = null) 
		{
			super(testMethod);
			
		}
		
		public function testMoving():void {
			var bee:IBee = new SimpleBee();
			bee.x = 1;
			bee.y = 1;
			bee.targetX = 3;
			bee.targetY = 3;
			assertFalse(_beeConditionsChecker.endMoveCondition(bee));
			bee.move();
			assertFalse(_beeConditionsChecker.endMoveCondition(bee));
			bee.move();
			assertTrue(_beeConditionsChecker.endMoveCondition(bee));			
		}
		
		
		public function unloadingTest():void {
			var bee:IBee = new SimpleBee();
			bee.ticks = 0;
			
			for (var i:int = 0; i < BeeConst.UNLOADING_TIME; i++) {
				assertFalse(_beeConditionsChecker.endUnloading(bee));
				bee.unloading();
				
			}
			assertTrue(_beeConditionsChecker.endUnloading(bee));
			
			
		}
		
		public function chargingTest():void {
			var bee:IBee = new SimpleBee();
			bee.ticks = 0;
			
			for (var i:int = 0; i < BeeConst.CHARGING_TIME; i++) {
				assertFalse(_beeConditionsChecker.endUnloading(bee));
				bee.unloading();
				
			}
			assertTrue(_beeConditionsChecker.endUnloading(bee));		
		}		
	}

}