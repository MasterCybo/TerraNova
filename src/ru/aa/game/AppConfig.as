/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.aa.game
{
	import ru.aa.game.commands.CloseApplicationCommand;
	import ru.aa.game.commands.InitFeathersCommand;
	import ru.aa.game.commands.LoadGameDataCommand;
	import ru.aa.game.commands.LoadRegionDataCommand;
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.commands.events.InitFeathersEvent;
	import ru.aa.game.commands.events.LoadGameDataEvent;
	import ru.aa.game.commands.events.LoadRegionDataEvent;
	import ru.aa.game.display.ContextView;
	import ru.aa.game.display.screens.mediators.BackpackScreenMediator;
	import ru.aa.game.display.screens.mediators.BattleScreenMediator;
	import ru.aa.game.display.screens.mediators.BriefingScreenMediator;
	import ru.aa.game.display.screens.mediators.CommunicatorScreenMediator;
	import ru.aa.game.display.screens.mediators.RegionScreenMediator;
	import ru.aa.game.display.screens.mediators.MainMenuScreenMediator;
	import ru.aa.game.display.screens.mediators.HeroScreenMediator;
	import ru.aa.game.display.screens.mediators.WorldMapScreenMediator;
	import ru.aa.game.display.screens.region.RegionMap;
	import ru.aa.game.display.screens.views.BackpackScreen;
	import ru.aa.game.display.screens.views.BattleScreen;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.display.screens.views.CommunicatorScreen;
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.display.screens.views.PersonageScreen;
	import ru.aa.game.display.screens.views.WorldMapScreen;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.mediators.ContextViewMediator;
	import ru.aa.game.mediators.RegionMapMediator;
	import ru.aa.game.mediators.WorldMapMediator;
	import ru.aa.game.models.MoGame;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.services.GameDataService;
	import ru.aa.game.services.GameStateService;
	import ru.aa.game.player.commands.PlayerLoadCommand;
	import ru.aa.game.player.commands.PlayerSaveCommand;
	import ru.aa.game.player.events.PlayerServiceEvent;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class AppConfig extends Config
	{
		public function AppConfig(context:IContext)
		{
			super(context);
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			mapSingletons();
			mapCommands();
			mapMediators();
			
			context.dispatchEvent(new InitFeathersEvent(InitFeathersEvent.INIT_FEATHERS));
		}
		
		private function mapSingletons():void
		{
			map(GameStateService).toValue(new GameStateService());
			map(GameDataService).toValue(new GameDataService());
			
			map(MoGame).asSingleton(MoGame);
			map(MoHero).asSingleton(MoHero);
			map(IWorld).asSingleton(MoWorld);
		}
		
		private function mapCommands():void
		{
			map(InitFeathersEvent.INIT_FEATHERS).toCommand(InitFeathersCommand);
			
			map(AppEvent.CLOSE_APPLICATION).toCommand(CloseApplicationCommand);
			map(LoadGameDataEvent.LOAD_GAME_DATA).toCommand(LoadGameDataCommand);
			map(LoadRegionDataEvent.LOAD_REGION_DATA).toCommand(LoadRegionDataCommand);
			
			map(PlayerServiceEvent.LOAD_STATE).toCommand(PlayerLoadCommand);
			map(PlayerServiceEvent.SAVE_STATE).toCommand(PlayerSaveCommand);
		}
		
		private function mapMediators():void
		{
			map(ContextViewMediator).toMediate(ContextView);
			map(MainMenuScreenMediator).toMediate(MainMenuScreen);
			map(BackpackScreenMediator).toMediate(BackpackScreen);
			map(CommunicatorScreenMediator).toMediate(CommunicatorScreen);
			map(BattleScreenMediator).toMediate(BattleScreen);
			map(BriefingScreenMediator).toMediate(BriefingScreen);
			map(RegionScreenMediator).toMediate(RegionScreen);
			map(HeroScreenMediator).toMediate(PersonageScreen);
			map(WorldMapScreenMediator).toMediate(WorldMapScreen);
			
			map(WorldMapMediator).toMediate(WorldMap);
			map(RegionMapMediator).toMediate(RegionMap);
		}
	}
}
