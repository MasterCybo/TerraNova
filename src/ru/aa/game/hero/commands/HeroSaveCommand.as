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
	
	public class HeroSaveCommand extends Command
	{
		public function HeroSaveCommand(context:IContext, event:HeroServiceEvent)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			var moHero:MoHero = injector.getOf(MoHero);
			
			var fileService:FileService = injector.getOf(FileService);
			fileService.save("player.txt", moHero);
		}
	}
}
