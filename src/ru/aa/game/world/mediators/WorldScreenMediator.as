/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.world.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.world.views.WorldScreen;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.events.Event;
	
	public class WorldScreenMediator extends Mediator
	{
		public function WorldScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
			
			var hero:MoHero = injector.getOf(MoHero);
			view.world = hero.position.world;
			
			trace("Display world : " + hero.position.world);
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		private function get view():WorldScreen { return getView() as WorldScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case WorldScreen.BUTTON_MAIN_MENU:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.MAIN_MENU));
					break;
				case WorldScreen.BUTTON_COMMUNICATOR:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.COMMUNICATOR));
					break;
				case WorldScreen.BUTTON_BACKPACK:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BACKPACK));
					break;
				case WorldScreen.BUTTON_PERSONAGE:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.PERSONAGE));
					break;
			}
		}
	}
}
