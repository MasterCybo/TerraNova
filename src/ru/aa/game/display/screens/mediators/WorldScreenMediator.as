/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.WorldScreen;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class WorldScreenMediator extends StarlingMediator
	{
		[Inject]
		public var hero:MoHero;
		
		[Inject]
		public var view:WorldScreen;
		
		public function WorldScreenMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			view.world = hero.position.world;
			
			trace("Display world : " + hero.position.world);
			
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
				case WorldScreen.BUTTON_MAIN_MENU:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.MAIN_MENU));
					break;
				case WorldScreen.BUTTON_COMMUNICATOR:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.COMMUNICATOR));
					break;
				case WorldScreen.BUTTON_BACKPACK:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BACKPACK));
					break;
				case WorldScreen.BUTTON_PERSONAGE:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.PERSONAGE));
					break;
			}
		}
	}
}
