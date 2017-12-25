/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.DataLoadService;
	
	import starling.events.EventDispatcher;
	
	public class StartRegionCommand extends Command
	{
		[Inject]
		public var hero:MoHero;
		
		[Inject]
		public var fileService:DataLoadService;
		
		[Inject]
		public var eventDispatcher:EventDispatcher;
		
		public function StartRegionCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			
			var region:IRegion = hero.position.region;
			
			fileService.addEventListener(Event.COMPLETE, onLoadComplete);
			fileService.verbose = true;
			fileService.load(region.dataURL, region);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var fileService:DataLoadService = event.target as DataLoadService;
			fileService.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.REGION_MAP));
		}
	}
}
