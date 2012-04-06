package com.robots.view 
{
	import com.robots.model.IBee;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class VBee extends MovieClip
	{
		private var _model:IBee;
		
		public function VBee() 
		{
			
		}
		
		
		
		public function get model():IBee 
		{
			
			return _model;
		}
		
		public function set model(value:IBee):void 
		{		
			_model = value;			
			update();
		}
		
		public function update():void {
			this.x = model.x;
			this.y = model.y;					
		}
		
	}

}