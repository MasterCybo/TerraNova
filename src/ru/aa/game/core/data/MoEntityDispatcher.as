/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.core.data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class MoEntityDispatcher extends MoEntity implements IEntityDispatcher
	{
		private var _eventDispatcher:EventDispatcher;
		
		/**
		 * Сущность, которая может уведомлять событиями об изменении своих параметров
		 */
		public function MoEntityDispatcher()
		{
			super();
			_eventDispatcher = new EventDispatcher(this);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _eventDispatcher.willTrigger(type);
		}
	}
}
