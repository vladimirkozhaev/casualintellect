package org.casualintellect.statemachineclases 
{
	import flash.utils.Dictionary;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	/**
	 * @author vkozhaev
	 */
	public class StateFactory
	{
		
		public function StateFactory() 
		{
			
		}
		private static const STATE_METHODS:Array =new Array(XmlDescriptionsParser.METHODS_AFTER, XmlDescriptionsParser.METHODS_BEFORE, XmlDescriptionsParser.METHODS_IN_PROCESS);
		
		public static function createState(stateXML:XML):State {
			var state:State = new State();
			
			state.name = stateXML.@name;
			state.conditions = new Dictionary();
			
			var usecasesList:XMLList = (stateXML.child(XmlDescriptionsParser.USECASES)[0] as XML).children();
			
			
			for each (var usecaseXML:XML in usecasesList) {
				var useCase:UseCase = UseCaseFactory.createUseCase(usecaseXML);
				state.conditions[useCase.newStateName] = useCase;
			}
			
			var stateMethods:XML = stateXML.child(XmlDescriptionsParser.STATE_METHODS)[0];
			if (stateMethods != null) {
				for each (var methodsType:String in STATE_METHODS) {
					var methodsTypeXml:XML = stateMethods.child(methodsType)[0];
					if (methodsTypeXml != null) {
						var methodsTypeList:Vector.<String> = createMetodsList(methodsTypeXml.children());
						state.setMethods(methodsType, methodsTypeList);
					}
				}
			}
			
			return state;
		}
		
		public static function createMetodsList(metodsXmlList:XMLList):Vector.<String> {
			var methods:Vector.<String> = new Vector.<String>();
			
			for each (var methodXML:XML in metodsXmlList) {
				methods.push(methodXML.@name);
			}
			
			return methods;
		}
		
	}

}