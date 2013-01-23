package org.casualintellect.xmlparsing 
{
	import flash.utils.Dictionary;
	import flash.xml.XMLParser;
	import org.casualintellect.IDSLexer;
	import org.casualintellect.statemachineclases.State;
	import org.casualintellect.statemachineclases.StateFactory;
	/**
	 * Method for parsing statemachine
	 * @author vkozhaev
	 */
	public class XmlDescriptionsParser implements IDSLexer
	{
		
		
		public function XmlDescriptionsParser() 
		{
			
		}
		
		public function parseScript(script:String):Dictionary {
			var xml:XML = new XML(script);
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