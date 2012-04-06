package com.robots.tests 
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class RobotsTestSuite extends TestSuite
	{
		
		public function RobotsTestSuite() 
		{
			super();
			
			this.addTest(new BeeTestCase("testMoving"));	
			this.addTest(new BeeTestCase("unloadingTest"));	
			this.addTest(new BeeTestCase("chargingTest"));
			this.addTest(new ProcessBeeStatesTestCase("testProcessStates"));
		}
		
	}

}