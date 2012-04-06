package com.robots.tests 
{
	import asunit.framework.TestCase;
	import com.robots.controller.BeeController;
	import com.robots.model.SimpleBee;
	import com.robots.states.StatesXML;
	import flash.utils.Dictionary;
	import org.casualintellect.script.OperationsContainer;
	import org.casualintellect.statemachineclases.StatesProcessor;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ProcessBeeStatesTestCase extends TestCase 
	{
		
		private var _states:Dictionary;
		private var _statesProcessor:StatesProcessor;
		private var _beeController:BeeController;
		
		
		public function ProcessBeeStatesTestCase(testMethod:String = null) 
		{
			super(testMethod);
			
			
			var classNameStates:Dictionary = XmlDescriptionsParser.parseStatesXML(StatesXML.SIMPLE_BEE_STATES);
			_states = new Dictionary(true);
			
			_states[SimpleBee.CLASS_NAME] = classNameStates;
			_statesProcessor = StatesProcessor.statesProcessor;
			_statesProcessor.states = _states;
			
			var opContainer:OperationsContainer = new OperationsContainer();
			opContainer.addFunction("finishMoving", _beeController.endMoveCondition);
			opContainer.addFunction("move", _beeController.move)
			opContainer.addFunction("beforeMoving", _beeController.beforeMoving)
			opContainer.addFunction("afterMoving", _beeController.afterMoving);
			opContainer.addFunction("endWating", _beeController.endWating);
			opContainer.addFunction("movingIsFinished", _beeController.endMoveCondition);
			opContainer.addFunction("watingIsFinished", _beeController.watingIsFinished);
			opContainer.addFunction("beforeWating", _beeController.beforeWating);
			opContainer.addFunction("afterWating", _beeController.afterWating);
			opContainer.addFunction("wait", _beeController.wait);
			_statesProcessor.operationsContainer = opContainer;
		}
		
		public function testProcessStates():void {
			
		}
		
	}

}