package com.robots.states 
{
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class StatesXML
	{
		
		public function StatesXML() 
		{
			
		}
		
		public static const SIMPLE_BEE_STATES:XML=		<states>
			<state name="move_to_tower">
				<usecases>
					<usecase name="charging">
						<roole>
						((not energyIsLow) and (not needRepairTower)) or (goalIsGetted)
						</roole>
						<methods>
							<method name="endMoving"/>
						</methods>								
					</usecase>
					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="beforeMoving"/>						
					</methods_before>
					<methods_after>
						<method name="afterMoving"/>						
					</methods_after>
					<methods_in_process>
						<method name="move"/>						
					</methods_in_process>					
				</state_methods>
			</state>	

			<state name="charging">
				<usecases>
					<usecase name="move_to_tower">
						<roole>
						endCharging and hasNotChargedTowers
						</roole>
						<methods>
							<method name="endWating"/>							
						</methods>						
					</usecase>					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="beforeWating"/>
					</methods_before>
					<methods_after>
						<method name="afterWating"/>
					</methods_after>
					<methods_in_process>
						<method name="charge"/>						
					</methods_in_process>					
				</state_methods>
			</state>			
		</states>;
		
		public static const TOWER_STATES:XML=<states>
			<state name="broken">
				<usecases>
					<usecase name="repared">
						<roole>
						towerIsCharged
						</roole>
						<methods>
							<method name="repareTower"/>
						</methods>								
					</usecase>
					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="beforeBroken"/>						
					</methods_before>
					<methods_after>
						<method name="afterBroken"/>						
					</methods_after>					
				</state_methods>
			</state>		

			<state name="repared">
				<usecases>
					<usecase name="broken">
						<roole>
						towerIsCharged
						</roole>
						<methods>
							<method name="brokeTower"/>
						</methods>								
					</usecase>
					
				</usecases>
				<state_methods>
					<methods_before>
						<method name="beforeRepared"/>						
					</methods_before>
					<methods_after>
						<method name="afterRepared"/>						
					</methods_after>					
				</state_methods>
			</state>			
		</states>;
		
		
	}

}