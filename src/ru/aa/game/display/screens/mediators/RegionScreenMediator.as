/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.player.models.MoHero;
	
	import starling.events.Event;
	
	public class RegionScreenMediator extends StarlingMediator
	{
		[Inject]
		public var hero:MoHero;
		
		[Inject]
		public var view:RegionScreen;
		
		public function RegionScreenMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			view.region = hero.position.region;
			
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
				case RegionScreen.BUTTON_LEAVE:
					eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
					break;
			}
		}
	}
}
