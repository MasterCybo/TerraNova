package ru.aa.game.configs
{
	import ru.aa.game.commands.BeginNewGameCommand;
	import ru.aa.game.commands.CloseApplicationCommand;
	import ru.aa.game.commands.StartRegionCommand;
	import ru.aa.game.commands.StartWorldCommand;
	import ru.aa.game.commands.StartupCommand;
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.commands.events.StartRegionEvent;
	import ru.aa.game.commands.events.StartWorldEvent;
	import ru.aa.game.player.commands.HeroLoadCommand;
	import ru.aa.game.player.commands.HeroSaveCommand;
	import ru.aa.game.player.events.HeroServiceEvent;
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class CommandsConfig extends Config
	{
		public function CommandsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			map(AppEvent.STARTUP_APPLICATION).toCommand(StartupCommand);
			map(AppEvent.CLOSE_APPLICATION).toCommand(CloseApplicationCommand);
			map(AppEvent.BEGIN_NEW_GAME).toCommand(BeginNewGameCommand);
			map(StartWorldEvent.START_WORLD).toCommand(StartWorldCommand);
			map(StartRegionEvent.START_REGION).toCommand(StartRegionCommand);
			
			map(HeroServiceEvent.LOAD_STATE).toCommand(HeroLoadCommand);
			map(HeroServiceEvent.SAVE_STATE).toCommand(HeroSaveCommand);
		}
	}
}
