/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.location.commands
{
	import flash.events.Event;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.location.events.StartLocationEvent;
	import ru.aa.game.location.models.ILocation;
	import ru.aa.game.services.DataLoadService;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class StartLocationCommand extends Command
	{
		public function StartLocationCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		private function get event():StartLocationEvent { return getEvent() as StartLocationEvent; }
		
		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = injector.getOf(MoHero);
			var region:ILocation = hero.position.region;
			
			var fileService:DataLoadService = injector.getOf(DataLoadService);
			fileService.addEventListener(Event.COMPLETE, onLoadComplete);
			fileService.verbose = true;
			fileService.load(region.dataURL, region);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var fileService:DataLoadService = event.target as DataLoadService;
			fileService.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.REGION_MAP));
		}
	}
}
