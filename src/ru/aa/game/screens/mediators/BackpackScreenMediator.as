/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.screens.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.screens.views.BackpackScreen;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.events.Event;
	
	public class BackpackScreenMediator extends Mediator
	{
		public function BackpackScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
			
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
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_PREVIOUS));
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
