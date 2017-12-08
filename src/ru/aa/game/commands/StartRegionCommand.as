/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.commands.events.StartRegionEvent;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.GameDataStorage;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class StartRegionCommand extends Command
	{
		public function StartRegionCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		private function get event():StartRegionEvent { return getEvent() as StartRegionEvent; }
		
		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = getOf(MoHero);
			var region:IRegion = hero.position.region;
			
			var fileService:GameDataStorage = getOf(GameDataStorage);
			fileService.addEventListener(Event.COMPLETE, onLoadComplete);
			fileService.verbose = true;
			fileService.load(region.dataURL, region);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var fileService:GameDataStorage = event.target as GameDataStorage;
			fileService.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.REGION_MAP));
		}
	}
}
