/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.core.display.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AppSprite extends Sprite
	{
		public function AppSprite()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		override public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			super.dispose();
		}
		
		protected function addedToStageHandler(event:Event):void
		{
			
		}
	}
}
