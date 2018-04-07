/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.location.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.location.views.LocationScreen;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.events.Event;
	
	public class LocationScreenMediator extends Mediator
	{
		public function LocationScreenMediator(context:IContext)
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
		
		private function get view():LocationScreen { return getView() as LocationScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case LocationScreen.BUTTON_LEAVE:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
					break;
			}
		}
	}
}
