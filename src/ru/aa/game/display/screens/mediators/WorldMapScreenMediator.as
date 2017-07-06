/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.WorldMapScreen;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class WorldMapScreenMediator extends Mediator
	{
		public function WorldMapScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			var hero:MoHero = getOf(MoHero);
			view.world = hero.position.world;
			
			trace("Display world : " + hero.position.world);
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		private function get view():WorldMapScreen { return getView() as WorldMapScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case WorldMapScreen.BUTTON_MAIN_MENU:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.MAIN_MENU));
					break;
				case WorldMapScreen.BUTTON_COMMUNICATOR:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.COMMUNICATOR));
					break;
				case WorldMapScreen.BUTTON_BACKPACK:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BACKPACK));
					break;
				case WorldMapScreen.BUTTON_PERSONAGE:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.PERSONAGE));
					break;
			}
		}
	}
}
