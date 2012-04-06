package com.robots.view 
{
	import com.robots.events.GameEvent;
	import com.robots.model.Gameboard;
	import com.robots.model.IBee;
	import com.robots.model.IGameObject;
	import com.robots.model.ITower;
	import com.robots.model.SimpleBee;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class VGameboard extends Sprite
	{
		
		var _gameboard:Gameboard;
		var _beesView:Vector.<VBee>;
		var _towersView:Vector.<VTower>;
		
		public function VGameboard() 
		{
			_gameboard = new Gameboard();
			_gameboard.gameTimer.start();
			_gameboard.addEventListener(GameEvent.UPDATE, updateHandler);
			
			initBeesView();
			initTowersView();
		}
		
		private function initBeesView():void 
		{
			_beesView = new Vector.<VBee>();
			
			for each (var gameObject:IBee in _gameboard.bees) {
				var movieClip:MovieClip;
				
				var vBee:VBee = createBeeView(gameObject);
				_beesView.push(vBee);
				
			}
		}		
		
		
		private function initTowersView():void 
		{
			_towersView = new Vector.<VTower>();
			
			for each (var tower:ITower in _gameboard.towers) {
				var movieClip:MovieClip;
				
				var vTower:VTower = createTowerView(tower);
				_towersView.push(vTower);
				
			}
		}
		
		private function createBeeView( bee:IGameObject):VBee 
		{
			var vBee:VBee = new VBee();
			vBee.model = bee as IBee;
			this.addChild(vBee);
			return vBee;
		}
		
		
		private function createTowerView( tower:ITower):VTower 
		{
			var vTower:VTower = new VTower();
			vTower.model = tower;
			this.addChild(vTower);
			return vTower;
		}
		
		public function updateHandler(e:GameEvent):void {
			for each (var vBee:VBee in _beesView) {
				vBee.update();
			}
		
		}
		
		
	}

}