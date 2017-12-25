/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.BackpackScreen;
	
	import starling.events.Event;
	
	public class BackpackScreenMediator extends StarlingMediator
	{
		[Inject]
		public var view:BackpackScreen;
		
		public function BackpackScreenMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case BackpackScreen.BUTTON_BACK:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_PREVIOUS));
					break;
//				case BackpackScreen.BUTTON_BACKPACK:
//					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BACKPACK));
//					break;
//				case BackpackScreen.BUTTON_PERSONAGE:
//					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.PERSONAGE));
//					break;
			}
		}
	}
}
