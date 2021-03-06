/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.screens.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.location.events.StartLocationEvent;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.screens.views.BriefingScreen;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.events.Event;
	
	public class BriefingScreenMediator extends Mediator
	{
		public function BriefingScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
			
			var hero:MoHero = injector.getOf(MoHero);
			view.region = hero.position.region;
			
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
					dispatchEvent(new StartLocationEvent(StartLocationEvent.START_LOCATION));
					break;
			}
		}
	}
}
