/**
 * Created by Artem on 27.03.2016.
 */
package ru.aa.game.player.commands
{
	import ru.aa.game.core.serialize.ISerializable;
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.player.events.PlayerServiceEvent;
	import ru.aa.game.player.models.IPlayer;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class PlayerLoadCommand extends Command
	{
		public function PlayerLoadCommand(context:IContext, event:PlayerServiceEvent)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();
			
			var user:IPlayer = getOf(IPlayer);
			
			var fileService:FileService = getOf(FileService);
			fileService.load("player.txt", user as ISerializable);
		}
	}
}
