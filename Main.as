package
{
	import asunit.textui.TestRunner;
	import com.robots.tests.RobotsTestSuite;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.casualintellect.script.ScriptInterpreter;
	import org.casualintellect.script.tests.ScriptTestSuite;
	import org.casualintellect.statemachineclases.tests.StatesTestSuite;
	import org.casualintellect.xmlparsing.test.ParserTestSuite;

	/**
	 * ...
	 * @author vkozhaev
	 */
	public class Main extends Sprite
	{

		public function Main()
		{
			this.addEventListener(Event.ENTER_FRAME,onEnterFrame)
		}

		public function onEnterFrame(e:Event) {

			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame)
			new ScriptInterpreter();
			var a:ScriptInterpreter = ScriptInterpreter.instance;

			var unittests:TestRunner;

			unittests = new TestRunner();
			stage.addChild(unittests);
			unittests.start(org.casualintellect.script.tests.ScriptTestSuite, null, TestRunner.SUCCESS_EXIT);

			unittests = new TestRunner();
			stage.addChild(unittests);
			unittests.start(org.casualintellect.xmlparsing.test.ParserTestSuite, null, TestRunner.SUCCESS_EXIT);

			unittests = new TestRunner();
			stage.addChild(unittests);
			unittests.start(RobotsTestSuite, null, TestRunner.SUCCESS_EXIT);

			unittests = new TestRunner();
			stage.addChild(unittests);
			unittests.start(StatesTestSuite, null, TestRunner.SUCCESS_EXIT);

		}

	}

}