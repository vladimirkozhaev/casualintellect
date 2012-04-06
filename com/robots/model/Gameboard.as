package com.robots.model 
{
	import com.robots.BeeConst;
	import com.robots.controller.BeeController;
	import com.robots.events.GameEvent;
	import com.robots.states.StatesXML;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import org.casualintellect.script.OperationsContainer;
	import org.casualintellect.statemachineclases.StatesProcessor;
	import org.casualintellect.xmlparsing.XmlDescriptionsParser;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class Gameboard extends EventDispatcher
	{

		 
		private var _bees:Vector.<IGameObject>;
		private var _towers:Vector.<ITower>;
		private var _gameTimer:Timer;
		private var _statesProcessor:StatesProcessor;
		private var _beeController:BeeController;
		
		
		public function Gameboard() 
		{
			
			
				
				
				initBeesModels();
				
				initTowersModels();
				
				initStMachine();
				_gameTimer = new Timer(BeeConst.MAIN_TIMER_TIME);
			
				_gameTimer.addEventListener(TimerEvent.TIMER, mainTimerTickHandler);
		
			
			
		}
		
		private function initTowersModels():void 
		{
			_towers = new Vector.<ITower>();
			
			var tower:ITower;
			
			tower = new SimpleTower();
			
			tower.x = 300;
			tower.y = 300;
			_towers.push(tower)
			
			tower = new SimpleTower();
			
			tower.x = 100;
			tower.y = 300;
			_towers.push(tower)
						
			tower = new SimpleTower();
			
			tower.x = 400;
			tower.y = 100;
			_towers.push(tower)
			
			tower = new SimpleTower();
			tower.x = 100;
			tower.y = 100;
			_towers.push(tower)
			
			tower = new SimpleTower();
			tower.x = 150;
			tower.y = 150;
			_towers.push(tower)
		}
		
		
		private function initBeesModels():void 
		{
			_bees = new Vector.<IGameObject>();
			var bee:IBee = new SimpleBee();
		
			bee.state = "charging"
		
			bee.x = 10;
		
			bee.y = 10;		
		
			_bees.push(bee);		
			
			bee = new SimpleBee();
		
			bee.state = "charging"
		
			bee.x = 50;
		
			bee.y = 50;				
		
			_bees.push(bee);
		}
		
		
		private function initStMachine():void 
		{
		
			var classNameStates:Dictionary = XmlDescriptionsParser.parseStatesXML(StatesXML.SIMPLE_BEE_STATES);
			
			var states:Dictionary = new Dictionary(true);
			
			states[SimpleBee.CLASS_NAME] = classNameStates;
			
			
			_statesProcessor = StatesProcessor.statesProcessor;
				
			_statesProcessor.states = states;
				
			var opContainer:OperationsContainer = new OperationsContainer();
				
			_beeController = BeeController.instance;
				
			_beeController.gameboard = this;
			
			opContainer.addFunction("move", _beeController.move)
				
			opContainer.addFunction("beforeMoving", _beeController.beforeMoving)
				
			opContainer.addFunction("afterMoving", _beeController.afterMoving);
				
			opContainer.addFunction("endMoving", _beeController.endMoving);
			
			opContainer.addFunction("energyIsLow", _beeController.energyIsLow);
			 
			opContainer.addFunction("goalIsGetted", _beeController.goalIsGetted);	
				
			opContainer.addFunction("endWating", _beeController.endWating);
				
			opContainer.addFunction("watingIsFinished", _beeController.watingIsFinished);
				
			opContainer.addFunction("movingIsFinished", _beeController.endMoveCondition);
				
			opContainer.addFunction("beforeWating", _beeController.beforeWating);
				
			opContainer.addFunction("afterWating", _beeController.afterWating);
			
			opContainer.addFunction("needRepairTower", _beeController.needRepairTower);
				
			opContainer.addFunction("wait", _beeController.wait);
			
			opContainer.addFunction("endCharging", _beeController.endCharging);
			
			opContainer.addFunction("hasNotChargedTowers", _beeController.hasNotChargedTowers)
			
			opContainer.addFunction("charge",_beeController.charge);
				
			_statesProcessor.operationsContainer = opContainer;
		}
		
		
		private function mainTimerTickHandler(e:TimerEvent):void 
		{
			
			updateBees();
			
			dispatchEvent(new GameEvent(GameEvent.UPDATE));
			e.updateAfterEvent();
			
		}
		
		private function updateBees():void 
		{
			for each (var bee:IBee in _bees) {
				_statesProcessor.processState(bee);			
			}
		}
		
		
		public function get unchargedTowers():Vector.<ITower> {
			return _towers.filter(unchargedFilter, null);
		}
		
		private function unchargedFilter(tower:ITower,index:int, vector:Vector.<ITower>):Boolean {
			return (tower.chargeLevel == 0&&!tower.willBeCharged);
		}
		
		public function get bees():Vector.<IGameObject> 
		{
			return _bees;
		}
		
		public function set bees(value:Vector.<IGameObject>):void 
		{
			_bees = value;
		}
		
		public function get gameTimer():Timer 
		{
			return _gameTimer;
		}
		
		public function get towers():Vector.<ITower> 
		{
			return _towers;
		}
		
		public function set towers(value:Vector.<ITower>):void 
		{
			_towers = value;
		}
		
		
	}

}