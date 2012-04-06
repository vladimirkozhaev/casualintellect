package com.robots.model 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	/**
	 * ...
	 * @author vkozhaev
	 */
	public class GameObject implements IGameObject
	{
		
		
		protected var _x:Number;
		protected var _y:Number;
		protected var _targetX:Number;
		protected var _targetY:Number;
		protected var _life:int;
		
		protected var _stateName:String;
		protected var _state:String;
		protected var _ticks:int;
		private var _dispatcher:EventDispatcher;
		
		public function GameObject() 
		{
			_dispatcher = new EventDispatcher(this);
		}
		
		
		
               
		public function DecoratedDispatcher() {
			_dispatcher = new EventDispatcher(this);
		}
			   
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void{
			_dispatcher.addEventListener(type, listener, useCapture, priority);
		}
			   
		public function dispatchEvent(evt:Event):Boolean{
			return _dispatcher.dispatchEvent(evt);
		}
		
		public function hasEventListener(type:String):Boolean{
			return _dispatcher.hasEventListener(type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void{
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
					   
		public function willTrigger(type:String):Boolean {
			return _dispatcher.willTrigger(type);
		}
		
		/* INTERFACE com.robots.model.IGameObject */
		
		public function get life():int 
		{
			return _life;
		}
		
		public function set life(val:int):void 
		{
			this._life = life;
		}
			
		
		public function charging():void 
		{
			/**
			 * @TODO Add charging process
			 */
		}
		
		public function unloading():void {
			ticks++;
		}
		
		public function get ticks():int 
		{
			return _ticks;
		}
		
		public function set ticks(val:int):void 
		{
			this._ticks = val;
		}
		
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
		public function get stateName():String 
		{
			return _stateName;
		}
		
		public function set stateName(value:String):void 
		{
			_stateName = value;
		}	
		
		public function get targetX():Number 
		{
			return _targetX;
		}
		
		public function set targetX(value:Number):void 
		{
			_targetX = value;
		}
		
		public function get targetY():Number 
		{
			return _targetY;
		}
		
		public function set targetY(value:Number):void 
		{
			_targetY = value;
		}
		
		
		
		
		public function get state():String {
			return _state;
		}
		
		public function set state(val:String):void {
			this._state = val;
		}
		
	}

}