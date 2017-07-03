/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class BriefingScreenMediator extends Mediator
	{
		public function BriefingScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			var moHero:MoHero = getOf(MoHero);
			view.region = moHero.position.region;
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		public function get view():BriefingScreen { return getView() as BriefingScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case BriefingScreen.BUTTON_BACK:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_PREVIOUS));
					break;
				case BriefingScreen.BUTTON_BEGIN:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.REGION_MAP));
					break;
			}
		}
	}
}
