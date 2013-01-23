package org.casualintellect.xmlparsing.test 
{
	import asunit.framework.TestCase;
	import flash.utils.Dictionary;
	import org.casualintellect.IDSLexer;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class ParserTestCase extends TestCase
	{
		public static const STATES_1:XML =
		<states>
			<state name="statea">
				<usecases>
					<usecase name="stateb">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1_1"/>
							<method name="f1_2"/>
							<method name="f1_3"/>
							<method name="f1_4"/>
						</methods>								
					</usecase>
					<usecase name="statec">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f2_1"/>
							<method name="f2_2"/>
							<method name="f2_3"/>
							<method name="f2_4"/>
						</methods>						
					</usecase>
					<usecase name="stated">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f3_1"/>
							<method name="f3_2"/>
							<method name="f3_3"/>
							<method name="f3_4"/>
						</methods>						
					</usecase>
				</usecases>
				<state_methods>
					<methods_before>
						<method name="statea_before_1"/>
						<method name="statea_before_2"/>
						<method name="statea_before_3"/>
						<method name="statea_before_4"/>
					</methods_before>
					<methods_after>
						<method name="statea_after_1"/>
						<method name="statea_after_2"/>
						<method name="statea_after_3"/>
						<method name="statea_after_4"/>
					</methods_after>
					<methods_in_process>
						<method name="statea_inprocess_1"/>
						<method name="statea_inprocess_2"/>
						<method name="statea_inprocess_3"/>
						<method name="statea_inprocess_4"/>
					</methods_in_process>					
				</state_methods>
			</state>
			<state name="stateb">
				<usecases>
					<usecase name="state_x">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase>
					<usecase name="state_y">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase>
					<usecase name="state_z">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase>
				</usecases>

			</state>
			<state name="statec">
				
				<usecases>
					<usecase name="state_k">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase >
					<usecase name="state_l">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase>
					<usecase name="statea">
						<roole>
							a and b and c
						</roole>
						<methods>
							<method name="f1"/>
							<method name="f2"/>
							<method name="f3"/>
							<method name="f4"/>
						</methods>						
					</usecase>
				</usecases>
			</state>
			
			</states>;
		public function ParserTestCase(testMethod:String = null) 
		{
			super(testMethod);
			
		}
		
		public function testParsing():void {
			var dslLexer:IDSLexer = new XmlDescriptionsParser();
			var states:Dictionary = dslLexer.parseScript(STATES_1.toXMLString());
			
			assertNotNull(states["statea"])
			assertNotNull(states["stateb"])
			assertNotNull(states["statec"])
			
			
			
		}
		
		
		
		
		
		
		
	}

}