package org.casualintellect.statemachineclases 
{
	import org.casualintellect.script.ScriptInterpreter;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class UseCaseFactory
	{
		
		public function UseCaseFactory() 
		{
			
		}
		
		public static function createUseCase(useCaseXML:XML):UseCase {
			var useCase:UseCase = null;
			var errNum:int = 0;
			try{
				var useCase:UseCase = new UseCase();
				errNum++;
				useCase.functions = new Vector.<String>();
				errNum++;
				useCase.newStateName = useCaseXML.@name;
				errNum++;
				useCase.functions = new Vector.<String>();
				errNum++;
				var methodsList:XMLList = (useCaseXML.child(XmlDescriptionsParser.METHODS)[0] as XML).children();
				errNum++;
				for each (var methodXML:XML in methodsList) {
					var methodName:String = methodXML.@name;
					useCase.functions.push(methodName)
				}
				errNum++;
				var roole:Roole = new Roole();
				errNum++;
				var rooleXml:String = (useCaseXML.child(XmlDescriptionsParser.ROOLE)[0] as XML) + "";
				errNum++;				
				roole.reversePolishNotation = ScriptInterpreter.instance.makeReversedPolishNotation(rooleXml);
				errNum++;
				useCase.roole = roole;
				errNum++;
				return useCase;
			}catch (e:Error) {
				trace(e.getStackTrace(),"err num:",errNum++);
			}
			
			return null;
		}
	}

}