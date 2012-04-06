package com.robots.view 
{
	import com.robots.events.GameEvent;
	import com.robots.model.ITower;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class VTower extends MovieClip
	{
		
		private var _model:ITower;
		
		public function VTower() 
		{
			
		}
		
		
		public function get model():ITower 
		{
			
			return _model;
		}
		
		public function set model(value:ITower):void 
		{		
			_model = value;	
			addEventListeners(_model);
			update();
			
		}
		
		public function update():void {
			this.x = model.x;
			this.y = model.y;					
			trace("tower x:",x,"tower.y",y);
		}
		
		private function addEventListeners(_simpleTower:ITower):void {
			
			_simpleTower.addEventListener(GameEvent.TOWER_IS_CHARGED, chargedTowerEventHandlrer);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpEventListener);
		}
		
		private function removeEventListeners(_simpleTower:ITower):void {
			
			_simpleTower.removeEventListener(GameEvent.TOWER_IS_CHARGED, chargedTowerEventHandlrer);
		}
		
		private function chargedTowerEventHandlrer(event:GameEvent):void {
			this.gotoAndStop("charged");
		}
		
		private function mouseUpEventListener(e:MouseEvent):void {
			this._model.chargeLevel = 0;
			this.gotoAndStop("uncharged");
		}
		
	}

}