/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display.screens.mediators
{
	import ru.aa.game.commands.events.LoadRegionDataEvent;
	import ru.aa.game.core.display.controls.AppButton;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.assets.RegionAssets;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.models.MoGame;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class RegionScreenMediator extends Mediator
	{
		public function RegionScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			dispatchEvent(new LoadRegionDataEvent(LoadRegionDataEvent.LOAD_REGION_DATA));
			
			var game:MoGame = getOf(MoGame);
			view.region = game.currentRegion;
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		private function get view():RegionScreen { return getView() as RegionScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:AppButton = event.target as AppButton;
			if (!button) return;
			
			switch (button.name) {
				case RegionScreen.BUTTON_LEAVE:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
					break;
			}
		}
	}
}
