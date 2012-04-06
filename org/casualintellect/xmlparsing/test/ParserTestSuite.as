package org.casualintellect.xmlparsing.test 
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ParserTestSuite extends TestSuite
	{
		
		public function ParserTestSuite() 
		{
			super();
			addTest(new ParserTestCase("testParsing"));
		}
		
	}

}