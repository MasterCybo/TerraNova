/**
 * Created by Artem on 27.03.2016.
 */
package ru.aa.game.player.commands
{
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.player.events.PlayerServiceEvent;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class PlayerSaveCommand extends Command
	{
		public function PlayerSaveCommand(context:IContext, event:PlayerServiceEvent)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			var moHero:MoHero = getOf(MoHero);
			
			var fileService:FileService = getOf(FileService);
			fileService.save("player.txt", moHero);
		}
	}
}
