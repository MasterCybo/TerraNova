/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.commands.events.StartRegionEvent;
	
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.GameDataService;
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
			
			var gameDataService:GameDataService = getOf(GameDataService);
			gameDataService.addEventListener(Event.COMPLETE, onLoadComplete);
			gameDataService.verbose = true;
			
			var moHero:MoHero = getOf(MoHero);
			var region:IRegion = moHero.position.region;
			gameDataService.load(region.dataURL, region);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var gameDataService:GameDataService = event.target as GameDataService;
			gameDataService.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new StartRegionEvent(StartRegionEvent.READY_REGION));
		}
	}
}
