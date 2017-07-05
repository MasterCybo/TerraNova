/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.core.display.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class AppSprite extends Sprite
	{
		protected var _width:int;
		protected var _height:int;
		
		public function AppSprite()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		override public function dispose():void
		{
			removeEventListener(TouchEvent.TOUCH, touchHandler);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			super.dispose();
		}
		
		protected function onAddedToStage(event:Event):void
		{
			// override me
		}
		
		override public function set touchable(value:Boolean):void
		{
			super.touchable = value;
			
			if (value) {
				addEventListener(TouchEvent.TOUCH, touchHandler);
			} else {
				removeEventListener(TouchEvent.TOUCH, touchHandler);
			}
		}
		
		private function touchHandler(event:TouchEvent):void
		{
			removeEventListener(TouchEvent.TOUCH, touchHandler);
//			dispatchEventWith(TouchEvent.TOUCH, true);
			dispatchEvent(event);
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		public function setSize(width:int, height:int):void
		{
			if (width == _width && height == _height) return;
			_width = width;
			_height = height;
			applySize();
		}
		
		protected function applySize():void
		{
			// override me
		}
	}
}
