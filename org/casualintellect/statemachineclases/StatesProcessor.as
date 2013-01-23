package org.casualintellect.statemachineclases 
{
	import flash.utils.Dictionary;
	import org.casualintellect.Keywords;
	import org.casualintellect.script.OperationsContainer;
	import org.casualintellect.script.ScriptInterpreter;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class StatesProcessor
	{
		
		private static var _statesProcessor:StatesProcessor = new StatesProcessor();
		private var _states:Dictionary = new Dictionary();
		private var _operationsContainer:OperationsContainer;
		
		public function StatesProcessor() 
		{
			
		}
		
		static public function get statesProcessor():StatesProcessor 
		{
			return _statesProcessor;
		}
		
		static public function set statesProcessor(value:StatesProcessor):void 
		{
			_statesProcessor = value;
		}
		
		public function get states():Dictionary 
		{
			return _states;
		}
		
		public function set states(value:Dictionary):void 
		{
			_states = value;
		}
		
		public function get operationsContainer():OperationsContainer 
		{
			return _operationsContainer;
		}
		
		public function set operationsContainer(value:OperationsContainer):void 
		{
			_operationsContainer = value;
		}
		
		
		public function processState(stateObject:IStateObject):void {
			var i:int = 0;
			try{
				var concreteStates:Dictionary = _states[stateObject.className];
				i++;		
				if (concreteStates == null) {
					throw new Error("no states for name " + stateObject.className);
					
				}
				i++;
				var state:State = concreteStates[stateObject.state];
				i++;
				
				var conditions:Dictionary = state.conditions;
				i++;				
				for each (var useCase:UseCase in conditions) {
					var result:Boolean = ScriptInterpreter.instance.processReversedPolishNotationStack(operationsContainer, useCase.roole.reversePolishNotation, new Array(stateObject));
					
					if (result) {
						changeState(stateObject, useCase,state);
						return;
					}
				}
				i++;
				var methodNames:Vector.<String> = state.getMethods(Keywords.METHODS_IN_PROCESS);
				i++;
				for each (var fName:String in methodNames) 
				{
					_operationsContainer.applyFuncToArgs(fName, new Array(stateObject));
				}
				
			}catch (e:Error) {
				trace("i:",i,e.getStackTrace());
			}
			
			
		}
		
		private function changeState(stateObject:IStateObject, useCase:UseCase, state:State):void {
			var errNum:int = 0;
			try 
			{
				var concreteStates:Dictionary = _states[stateObject.className];
				var useCaseFunctions:Vector.<String> = useCase.functions;	
				errNum++;
				applyFuncsToStateObject(stateObject, useCaseFunctions);
				errNum++;
				
				var methodsAfter:Vector.<String> = state.getMethods(Keywords.METHODS_AFTER);
				errNum++;
				applyFuncsToStateObject(stateObject,methodsAfter)		
				errNum++;
				stateObject.state = useCase.newStateName;
				var newState:State=concreteStates[useCase.newStateName];
				var methodsBefore:Vector.<String> = newState.getMethods(Keywords.METHODS_BEFORE);
				
				applyFuncsToStateObject(stateObject,methodsBefore)		
			}catch (err:Error)
			{
				trace(err.getStackTrace(), "errNum", errNum);
			}
			
			
		}
		
		private function applyFuncsToStateObject(stateObj:IStateObject,funcNamesVector:Vector.<String>):void {
			for each (var fName:String in funcNamesVector ) {
				_operationsContainer.applyFuncToArgs(fName, new Array(stateObj));
						
			}
		}
		
		
	}

}