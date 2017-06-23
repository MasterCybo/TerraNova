/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.display.controls
{
	import feathers.controls.Button;
	
	import starling.events.Event;
	
	public class AppButton extends Button
	{
		public function AppButton()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			addEventListener(Event.TRIGGERED, triggeredHandler);
		}
		
		override public function dispose():void
		{
			removeEventListener(Event.TRIGGERED, triggeredHandler);
			super.dispose();
		}
		
		private function triggeredHandler(event:Event):void
		{
			removeEventListener(Event.TRIGGERED, triggeredHandler);
			dispatchEventWith(Event.TRIGGERED, true);
			addEventListener(Event.TRIGGERED, triggeredHandler);
		}
	}
}
