package org.casualintellect.script.tests 
{
	import asunit.framework.TestSuite;
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import org.casualintellect.script.ScriptInterpreter;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class Main extends Sprite
	{
		
		public function Main() 
		{
			super();
			var scripInterp:ScriptInterpreter = ScriptInterpreter.instance;
			/*trace("hello");
			var unittests:TestRunner = new TestRunner();
			stage.addChild(unittests);
			unittests.start(org.casualintellect.script.tests.ScriptTestSuite, null, TestRunner.SHOW_TRACE);*/
		}
		
	}

}