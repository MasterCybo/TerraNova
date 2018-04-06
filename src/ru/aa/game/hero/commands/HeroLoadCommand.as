/**
 * Created by Artem on 27.03.2016.
 */
package ru.aa.game.hero.commands
{
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.hero.events.HeroServiceEvent;
	import ru.aa.game.hero.models.MoHero;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class HeroLoadCommand extends Command
	{
		public function HeroLoadCommand(context:IContext, event:HeroServiceEvent)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = injector.getOf(MoHero);
			
			var fileService:FileService = injector.getOf(FileService);
			fileService.load("player.txt", hero);
		}
	}
}
