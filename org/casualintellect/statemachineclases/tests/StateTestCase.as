package org.casualintellect.statemachineclases.tests 
{
	import asunit.framework.TestCase;
	import com.robots.states.StatesXML;
	import flash.utils.Dictionary;
	import org.casualintellect.IDSLexer;
	import org.casualintellect.script.OperationsContainer;
	import org.casualintellect.statemachineclases.IStateObject;
	import org.casualintellect.statemachineclases.State;
	import org.casualintellect.statemachineclases.StatesProcessor;
	import org.casualintellect.statemachineclases.TestStateObject;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class StateTestCase extends TestCase
	{
		private var _states:Dictionary;
		private var _statesProcessor:StatesProcessor;
		
		public static const SIMPLE_BEE_STATES:XML =		
		<states>
			<state name="move">
				<usecases>
					<usecase name="wait">
						<roole>movingFinished</roole>
						<methods>
							<method name="saySomething"/>
						</methods>							
					</usecase>					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="statea_before_1"/>
						<method name="statea_before_2"/>						
					</methods_before>
					<methods_after>
						<method name="move_after_1"/>
						<method name="move_after_2"/>						
					</methods_after>
					<methods_in_process>
						<method name="move"/>						
					</methods_in_process>					
				</state_methods>
			</state>
			<state name="never_finished_state">
				<usecases>
					<usecase name="wait">
						<roole>neverFinished</roole>
						<methods>
							<method name="saySomething"/>
						</methods>												
					</usecase>					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="statea_before_1"/>
						<method name="statea_before_2"/>						
					</methods_before>
					<methods_after>
						<method name="statea_after_1"/>
						<method name="statea_after_2"/>						
					</methods_after>
					<methods_in_process>
						<method name="move"/>						
					</methods_in_process>					
				</state_methods>
			</state>		
			<state name="wait">
				<usecases>
					<usecase name="move">
						<roole>
						waitFinished
						</roole>
						<methods>
							<method name="choose_new_move"/>							
						</methods>						
					</usecase>					
				</usecases>
			</state>			
		</states>;		
		
			
		public function StateTestCase(testMethod:String = null) 
		{
			super(testMethod)
			var dsScript:IDSLexer = new XmlDescriptionsParser();
			var classNameStates:Dictionary = dsScript.parseScript(SIMPLE_BEE_STATES);
			_states = new Dictionary(true);
			_states["className"] = classNameStates;
			_statesProcessor = StatesProcessor.statesProcessor;
			_statesProcessor.states = _states;
			
			var opContainer:OperationsContainer = new OperationsContainer();
			opContainer.addFunction("movingFinished", movingFinished);
			opContainer.addFunction("waitFinished", waitFinished)
			opContainer.addFunction("saySomething", saySomething)
			opContainer.addFunction("move", move);
			opContainer.addFunction("neverFinished", neverFinished);
			opContainer.addFunction("move_after_1", moveAfter1);
			opContainer.addFunction("move_after_2", moveAfter2);
			_statesProcessor.operationsContainer = opContainer;
			
			
		
		}	
		private var _checkObjDict:Dictionary = new Dictionary(true);
		function waitFinished(obj:IStateObject):Boolean {
			return true;
		}
		
		function movingFinished(obj:IStateObject):Boolean {
			
			return (obj as TestStateObject).movingTicks == TestStateObject.MOVING_TICKS;
		}
		
		function move(obj:IStateObject):void {
			_checkObjDict["move"] = true;
			(obj as TestStateObject).processMove();
		}
		
		function moveAfter1(obj:IStateObject):void {
			_checkObjDict["move_after_1"] = true;			
		}
		
		function moveAfter2(obj:IStateObject):void {
			_checkObjDict["move_after_2"] = true;			
		}
		
		function wait(obj:IStateObject):void {
			_checkObjDict["wait"] = true;
			trace("wait wait wait");
		}
		
		
		function saySomething(obj:IStateObject):void {
			_checkObjDict["saySomething"] = true;
			trace("say something");
		}
		
		function neverFinished(obj:IStateObject):Boolean {
			return false;
		}
		
		public function testInProcessFunctionCall():void {
			var stateObject:IStateObject = new TestStateObject();
			stateObject.state = "never_finished_state";
			_statesProcessor.processState(stateObject);
			
			//assertTrue(_checkObjDict["saySomething"]);
			
		}
		
		public function testMovingState():void {
			var stateObject:IStateObject = new TestStateObject();
			stateObject.state = "move";
			
			for (var i:int = 0; i < TestStateObject.MOVING_TICKS; i++) {
				_statesProcessor.processState(stateObject);
				assertEquals(stateObject.state, "move");
			}
			
			_statesProcessor.processState(stateObject);
			assertEquals(stateObject.state, "wait");
			assertTrue(_checkObjDict["move_after_1"]);
			assertTrue(_checkObjDict["move_after_2"]);
			
			
		}
		
	}
}