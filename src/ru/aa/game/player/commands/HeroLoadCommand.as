/**
 * Created by Artem on 27.03.2016.
 */
package ru.aa.game.player.commands
{
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.player.events.HeroServiceEvent;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class HeroLoadCommand extends Command
	{
		public function HeroLoadCommand(context:IContext, event:HeroServiceEvent)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = getOf(MoHero);
			
			var fileService:FileService = getOf(FileService);
			fileService.load("player.txt", hero);
		}
	}
}
