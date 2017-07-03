/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.GameDataService;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class LoadRegionDataCommand extends Command
	{
		public function LoadRegionDataCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			var gameDataService:GameDataService = getOf(GameDataService);
			gameDataService.verbose = true;
			
			var moHero:MoHero = getOf(MoHero);
			var region:IRegion = moHero.position.region;
			gameDataService.load(region.dataURL, region);
		}
	}
}
