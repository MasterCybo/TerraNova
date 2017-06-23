/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.services.GameDataService;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class LoadGameDataCommand extends Command
	{
		public function LoadGameDataCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			var moWorld:IWorld = getOf(IWorld);
			
			var fileService:GameDataService = getOf(GameDataService);
			fileService.verbose = true;
			fileService.load("res/world01.json", moWorld);
			
			trace(moWorld);
		}
	}
}
