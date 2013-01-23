package org.casualintellect.script.tests
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ScriptTestSuite extends TestSuite
	{
		
		public function ScriptTestSuite() 
		{
			super();
			this.addTest(new ScriptTestCase("operationsTest"));
			this.addTest(new ScriptTestCase("splitOperationsTest"));
			this.addTest(new ScriptTestCase("reversePolishNotationTest"));
			this.addTest(new ScriptTestCase("splitElementsTest"));
			this.addTest(new ScriptTestCase("calculateReversePolishNotationTest"));
			
		}
		
	}

}