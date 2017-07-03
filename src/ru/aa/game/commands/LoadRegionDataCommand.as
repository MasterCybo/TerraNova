/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.models.MoGame;
	import ru.aa.game.models.region.MoRegion;
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
			
			// FIXME: Убрать использование MoGame
			var game:MoGame = getOf(MoGame);
			var region:MoRegion = new MoRegion();
			gameDataService.load(game.currentArea.dataURL, region);
			
			region.id = game.currentArea.id;
			region.name = game.currentArea.name;
			region.description = game.currentArea.description;
			
			game.currentRegion = region;
		}
	}
}
