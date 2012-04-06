package org.casualintellect.xmlparsing 
{
	import flash.utils.Dictionary;
	import flash.xml.XMLParser;
	import org.casualintellect.statemachineclases.State;
	import org.casualintellect.statemachineclases.StateFactory;
	/**
	 * Method for parsing statemachine
	 * @author vkozhaev
	 */
	public class XmlDescriptionsParser
	{
		public static const USECASES:String = "usecases";
		public static const USECASE:String = "usecase";
		public static const METHODS:String = "methods";
		
		public static const STATE_METHODS:String = "state_methods";
		public static const METHODS_BEFORE:String = "methods_before";
		public static const METHODS_AFTER:String = "methods_after";
		public static const METHODS_IN_PROCESS:String = "methods_in_process";
		public static const ROOLE:String = "roole";
		
		public function XmlDescriptionsParser() 
		{
			
		}
		
		public static function parseStatesXML(xml:XML):Dictionary {
			var conditionsDictionary:Dictionary = new Dictionary(true);
			var states:XMLList = xml.children();
			for each (var stateXML:XML in states) {
				var stateName:String = stateXML.@name;
				var state:State=StateFactory.createState(stateXML);
				conditionsDictionary[state.name] = state;
			}
			
			return conditionsDictionary;
			
		}
		
	}

}