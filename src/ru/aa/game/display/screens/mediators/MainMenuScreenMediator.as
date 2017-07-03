/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.commands.events.LoadGameDataEvent;
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class MainMenuScreenMediator extends Mediator
	{
		public function MainMenuScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
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
				case MainMenuScreen.BUTTON_THE_GAME:
					dispatchEvent(new AppEvent(AppEvent.START_NEW_GAME));
					break;
				case MainMenuScreen.BUTTON_QUIT:
					dispatchEvent(new AppEvent(AppEvent.CLOSE_APPLICATION));
					break;
			}
		}
	}
}
