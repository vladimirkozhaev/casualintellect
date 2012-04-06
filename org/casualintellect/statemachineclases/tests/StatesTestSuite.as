package org.casualintellect.statemachineclases.tests 
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class StatesTestSuite extends TestSuite
	{
		
		public function StatesTestSuite() 
		{
			super();
			this.addTest(new StateTestCase("testInProcessFunctionCall"));
			this.addTest(new StateTestCase("testMovingState"));
		}
		
	}

}