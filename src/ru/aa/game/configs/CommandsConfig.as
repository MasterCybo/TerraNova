package ru.aa.game.configs
{
	import ru.aa.game.commands.BeginNewGameCommand;
	import ru.aa.game.commands.CloseApplicationCommand;
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.hero.commands.HeroLoadCommand;
	import ru.aa.game.hero.commands.HeroSaveCommand;
	import ru.aa.game.hero.events.HeroServiceEvent;
	import ru.aa.game.location.commands.StartLocationCommand;
	import ru.aa.game.location.events.StartLocationEvent;
	import ru.aa.game.world.commands.StartWorldCommand;
	import ru.aa.game.world.events.StartWorldEvent;
	import ru.arslanov.starling.mvc.config.Config;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class CommandsConfig extends Config
	{
		public function CommandsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function configure():void
		{
			super.configure();
			
			commandMap.map(AppEvent.CLOSE_APPLICATION).toCommand(CloseApplicationCommand);
			commandMap.map(AppEvent.BEGIN_NEW_GAME).toCommand(BeginNewGameCommand);
			
			commandMap.map(StartWorldEvent.START_WORLD).toCommand(StartWorldCommand);
			commandMap.map(StartLocationEvent.START_REGION).toCommand(StartLocationCommand);
			
			commandMap.map(HeroServiceEvent.LOAD_STATE).toCommand(HeroLoadCommand);
			commandMap.map(HeroServiceEvent.SAVE_STATE).toCommand(HeroSaveCommand);
		}
	}
}
