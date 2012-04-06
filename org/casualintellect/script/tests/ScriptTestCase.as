package org.casualintellect.script.tests 
{
	import asunit.framework.TestCase;
	import org.casualintellect.script.OperationsContainer;
	import org.casualintellect.script.ScriptInterpreter;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ScriptTestCase extends TestCase
	{
		var _scriptIntterprteter:ScriptInterpreter;
		public function ScriptTestCase(testMethod:String = null) 
		{
			super(testMethod);
			_scriptIntterprteter = ScriptInterpreter.instance;
		}
		
		
		public function helloWorldTest():void {
			assertEquals(true,true);
		}
		
		public function operationsTest():void {
			assertEquals(ScriptInterpreter.instance.operations.length, 3);
			assertTrue(ScriptInterpreter.instance.operations.indexOf(ScriptInterpreter.AND) >= 0);
			assertTrue(ScriptInterpreter.instance.operations.indexOf(ScriptInterpreter.OR) >= 0);
			assertTrue(ScriptInterpreter.instance.operations.indexOf(ScriptInterpreter.NOT) >= 0);
		}
		
		public function splitOperationsTest():void {
			var lexemesArray:Array
			lexemesArray= ScriptInterpreter.splitOnLexemes("a   b c");
			assertEquals(lexemesArray.length, 3)
			assertEquals(lexemesArray[0], "a");
			assertEquals(lexemesArray[1], "b");
			assertEquals(lexemesArray[2], "c");
			
			lexemesArray = ScriptInterpreter.splitOnLexemes("(a  and b) c");
			assertEquals(lexemesArray.length, 6)
			assertEquals(lexemesArray[0], "(");
			assertEquals(lexemesArray[1], "a");
			assertEquals(lexemesArray[2], "and");
			assertEquals(lexemesArray[3], "b");
			assertEquals(lexemesArray[4], ")");
			
			lexemesArray = ScriptInterpreter.splitOnLexemes("  a  \n");
			assertEquals(lexemesArray.length, 1);
			
		
			
		}
		
		public function reversePolishNotationTest():void {
			var str:String = "a and b";
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			assertEquals(arr.length, 3);
			assertEquals(arr[0], "a");
			assertEquals(arr[1], "b");
			assertEquals(arr[2], "and");
			
			str = "a and b or c";
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			
			assertEquals(arr.length, 5)
			assertEquals(arr[0], "a");
			assertEquals(arr[1], "b");
			assertEquals(arr[2], "and");
			assertEquals(arr[3], "c");
			assertEquals(arr[4], "or");
			
			str = "not a";
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			
			assertEquals(arr.length, 2)
			assertEquals(arr[0], "a");
			assertEquals(arr[1], "not");
			
			str = "a and (b or c)"
			
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			
			assertEquals(arr.length, 5)
			
			assertEquals(arr[1], "b");
			assertEquals(arr[2], "c");
			assertEquals(arr[3], "or");
			assertEquals(arr[0], "a");
			assertEquals(arr[4], "and");
			
			str = "((not energyIsLow) and (not needRepairTower)) or (goalIsGetted)";
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			trace(arr);
			
			str = "(a or b) and c or d";
			
			var arr:Array = ScriptInterpreter.instance.makeReversedPolishNotation(str);
			assertNotNull(arr);
			trace(arr);
			
			assertEquals(arr[0], "a");
			assertEquals(arr[1], "b");
			assertEquals(arr[2], "or");
			assertEquals(arr[3], "c");
			assertEquals(arr[4], "and");
			assertEquals(arr[5], "d");
			assertEquals(arr[6], "or");
			

		}
		
		
		public function splitElementsTest():void {
			var splitEl:Array = ScriptInterpreter.splitWithEl(new Array("(a (b) c)"), ")");
			var splitEl:Array = ScriptInterpreter.splitWithEl(splitEl, "(");
			var etalonAr:Array = new Array("(","a","(","b",")","c",")");
			assertEquals(etalonAr.length, splitEl.length);
			
			for (var i:int = 0; i < etalonAr.length; i++ ) {
				assertEquals(etalonAr[i], splitEl[i]);
			}
		}
		
		
		public function calculateReversePolishNotationTest():void {
			var opContainer:OperationsContainer = new OperationsContainer();
			opContainer.testInit();
			var res:Boolean;
			res = ScriptInterpreter.instance.processReversedPolishNotationStack(opContainer, new Array("a", "b", "and"), new Array());
			assertFalse(res);
		}
		
	}

}