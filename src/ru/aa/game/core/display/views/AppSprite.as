/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.core.display.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	
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
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			super.dispose();
		}
		
		protected function onAddedToStage(event:Event):void
		{
		
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
		
		}
	}
}
