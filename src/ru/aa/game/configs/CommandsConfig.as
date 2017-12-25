package ru.aa.game.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.starlingCommandMap.api.IStarlingCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	
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
	
	import starling.events.EventDispatcher;
	
	public class CommandsConfig implements IConfig
	{
		[Inject]
		public var commandMap:IStarlingCommandMap;
		
		[Inject]
		public var eventDispatcher:EventDispatcher;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var context:IContext;
		
		public function CommandsConfig()
		{
			super();
		}
		
		public function configure():void
		{
			context.afterInitializing( initialize );
		}
		
		private function initialize():void
		{
			commandMap.map(AppEvent.STARTUP_APPLICATION).toCommand(StartupCommand);
//			commandMap.map(AppEvent.CLOSE_APPLICATION).toCommand(CloseApplicationCommand);
//			commandMap.map(AppEvent.BEGIN_NEW_GAME).toCommand(BeginNewGameCommand);
//
//			commandMap.map(StartWorldEvent.START_WORLD).toCommand(StartWorldCommand);
//			commandMap.map(StartRegionEvent.START_REGION).toCommand(StartRegionCommand);
//
//			commandMap.map(HeroServiceEvent.LOAD_STATE).toCommand(HeroLoadCommand);
//			commandMap.map(HeroServiceEvent.SAVE_STATE).toCommand(HeroSaveCommand);
			
			eventDispatcher.dispatchEvent(new AppEvent(AppEvent.STARTUP_APPLICATION));
		}
	}
}
