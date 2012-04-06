package org.casualintellect.script 
{
	import flash.utils.Dictionary;
	import org.casualintellect.ParserError;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ScriptInterpreter
	{
		private static  var _scriptInterprener:ScriptInterpreter =null;
		private static var _priorities:Dictionary = new Dictionary();
		private static var _numOfArguments:Dictionary = new Dictionary();
		
		public static var LEFT_BRACE = "(";
		public static var RIGHT_BRACE = ")";
		public static var AND:String = "and";
		public static var OR:String = "or";
		public static var NOT:String = "not";
		private var _operations:Array;
		
		
		
		public function ScriptInterpreter() 
		{
			_priorities[NOT] = 3;
			_priorities[AND] = 2;
			_priorities[OR] = 1;
			_priorities[LEFT_BRACE] = 0;
			_priorities[RIGHT_BRACE] = -1;
			
			_numOfArguments[AND] = 2;
			_numOfArguments[OR] = 2;
			_numOfArguments[NOT] = 1;
			_operations = [AND, OR, NOT];
		}
		
		
		
		
		public static  function get instance():ScriptInterpreter 
		{
			if (_scriptInterprener == null) {
				_scriptInterprener = new ScriptInterpreter();
			}
			return _scriptInterprener;
		}
		
		public function get priorities():Dictionary 
		{
			return _priorities;
		}
		
		public function set priorities(value:Dictionary):void 
		{
			_priorities = value;
		}
		
		public function get operations():Array 
		{
			return _operations;
		}
		/**
		 * 
		 * @param	op1
		 * @param	op2
		 * @return trur if priority of op1>op2 othervice - false
		 */
		
		public static function operationsPriority(op1:String,op2:String):Boolean {
			var op1Num:int = _priorities[op1] as int;
			var op2Num:int = _priorities[op2] as int;
			
			return op1 > op2;
		}
		
		public static function splitWithEl(arr:Array, element:String) {
			var returnedArr:Array = new Array()
			for each (var splitedEl:String in arr) {
				var splitAr:Array = splitedEl.split(element);
				for (var i = 0; i < splitAr.length; i++ ) {
					var el:String = StringUtil.trim(splitAr[i]);
					
					if (el != "") {
						returnedArr.push(el);
					}
					
					if (i<splitAr.length-1) {
						returnedArr.push(element.concat());
					}
				}
			}
			
			return returnedArr;
		}
		
		/**
		 * 
		 * @param str string with lexemes
		 * @return array with lexemes
		 */
		public static function splitOnLexemes(str:String):Array {
			
			var processedArr:Array = StringUtil.trim(str).split(/\ |\n|\r|\t/);
			var withBraces:Array = new Array();
			
			for each (var x:String in processedArr) {
				
				x = x.replace(" ", "");
				x = x.replace("\n", "");
				x = x.replace("\r", "");
				x = x.replace("\t", "");
				
				
				if (x.length > 0) {
					
					withBraces.push(x);
					
				}
				
				
			}
			
			withBraces = splitWithEl(withBraces, LEFT_BRACE);
			withBraces = splitWithEl(withBraces, RIGHT_BRACE);
			
			return withBraces;
			
		}
		
		
		
		
		/**
		 * 
		 * @param	scriptStr
		 * @return array with expression in reversed polish notation
		 */
		
		public function makeReversedPolishNotation(scriptStr:String):Array {
			
			scriptStr = StringUtil.trim(scriptStr);
			var lexemes:Array = splitOnLexemes(scriptStr);
			
			var operators:Array = new Array();
			var variables:Array = new Array();
			
			for each (var lexeme in lexemes) {
			
				 if (lexeme == LEFT_BRACE) {
					
					 operators.push(lexeme)
			
					
				}else if (lexeme==RIGHT_BRACE) {
					while (operators.length > 0 && operators[operators.length - 1] != LEFT_BRACE) {
						
						variables.push(operators.pop());
			
					}
					if (operators.length == 0) throw new ParserError(ParserError.LEFT_BRACE_EXISTS);
					operators.pop();
				}else if (_operations.indexOf(lexeme) >= 0) {
				
						
					
					if (operators.length != 0 || !operationsPriority(lexeme, operators[operators.length-1])) {
						while (operators.length>0&&operationsPriority(lexeme,operators[operators.length-1])&&operators[operators.length-1]!=LEFT_BRACE) {
							var operator:String = operators.pop();
							variables.push(operator);

						}					
						
					}
					operators.push(lexeme);

				}else {					
					variables.push(lexeme);

				}
			}
		
			if (operators.length>0){
				variables.push(operators.reverse());
			}			
			
			return variables;
		}
		/**
		 * 
		 * @param	operationsContainer
		 * @param	stack
		 * @return value of list, right now only boolean
		 */
		public  function processReversedPolishNotationStack(operationsContainer:OperationsContainer, reversePolishNotations:Array, args:Array):Boolean {
			try{
				
				var rightPolishNotations:Array = reversePolishNotations.reverse().concat();
				
				var stack:Vector.<Boolean> = new Vector.<Boolean>();
				
				while (rightPolishNotations.length >0 ) {
					var lexeme:String = rightPolishNotations.pop();
					
					if (_operations.indexOf(lexeme) >= 0) 
					{
						var stackLen:int = stack.length;
						
						var result:Boolean;
						switch(lexeme) {
							case OR:
								
								if (stackLen < 2) {
									throw ParserError (ParserError.NO_ENOUGH_ELEMENTS);
								}
								var arg1:Boolean = stack.pop();
								var arg2:Boolean = stack.pop();
								result = arg1 || arg2;							
								break;
							case AND:
								
								if (stackLen < 2) {
									throw ParserError (ParserError.NO_ENOUGH_ELEMENTS);
								}
								var arg1:Boolean = stack.pop();
								var arg2:Boolean = stack.pop();
								result = arg1 && arg2;							
								
								break;
							case NOT:
								if (stackLen < 1) {
									
									throw ParserError (ParserError.NO_ENOUGH_ELEMENTS);
								}
								result = !stack.pop();
								break;
						}
						
						stack.push(result);
						
					}else {
						
						var bool:Boolean = operationsContainer.applyFuncToArgs(lexeme, args);
						stack.push(bool);
						
					}
				}
				
				if (stack.length > 1) {
					
					throw new ParserError(ParserError.INCORRECT_LENGHT_OF_STACK);
				}
				
				return stack.pop();
			
		}catch (e:Error) {
			trace("error mess:",e.getStackTrace());
		}
		
		return null;
	}
	
	}

}