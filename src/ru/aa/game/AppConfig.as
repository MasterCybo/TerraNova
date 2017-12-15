/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.aa.game
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.commands.CloseApplicationCommand;
	import ru.aa.game.commands.StartupAppCommand;
	import ru.aa.game.commands.InitFeathersCommand;
	import ru.aa.game.commands.StartWorldCommand;
	import ru.aa.game.commands.StartRegionCommand;
	import ru.aa.game.commands.NewGameCommand;
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.commands.events.InitFeathersEvent;
	import ru.aa.game.commands.events.StartWorldEvent;
	import ru.aa.game.commands.events.StartRegionEvent;
	import ru.aa.game.display.AppView;
	import ru.aa.game.display.screens.mediators.BackpackScreenMediator;
	import ru.aa.game.display.screens.mediators.BattleScreenMediator;
	import ru.aa.game.display.screens.mediators.BriefingScreenMediator;
	import ru.aa.game.display.screens.mediators.CommunicatorScreenMediator;
	import ru.aa.game.display.screens.mediators.RegionScreenMediator;
	import ru.aa.game.display.screens.mediators.MainMenuScreenMediator;
	import ru.aa.game.display.screens.mediators.HeroScreenMediator;
	import ru.aa.game.display.screens.mediators.WorldScreenMediator;
	import ru.aa.game.display.region.RegionMap;
	import ru.aa.game.display.screens.views.BackpackScreen;
	import ru.aa.game.display.screens.views.BattleScreen;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.display.screens.views.CommunicatorScreen;
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.display.screens.views.PersonageScreen;
	import ru.aa.game.display.screens.views.WorldScreen;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.mediators.AppViewMediator;
	import ru.aa.game.mediators.RegionMapMediator;
	import ru.aa.game.mediators.WorldMapMediator;
	import ru.aa.game.models.collections.ItemsKindCollection;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.services.GameDataStorage;
	import ru.aa.game.services.GameStateStorage;
	import ru.aa.game.player.commands.HeroLoadCommand;
	import ru.aa.game.player.commands.HeroSaveCommand;
	import ru.aa.game.player.events.HeroServiceEvent;
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
		}
		
		private function mapSingletons():void
		{
			map(GameStateStorage).toValue(new GameStateStorage());
			map(GameDataStorage).toValue(new GameDataStorage());
			
			map(ItemsKindCollection).asSingleton(ItemsKindCollection);
			map(MoHero).asSingleton(MoHero);
			map(IWorld).toValue(new MoWorld(Files.DEFAULT_WORLD));
		}
		
		private function mapCommands():void
		{
			map(AppEvent.STARTUP_APPLICATION).toCommand(StartupAppCommand);
			map(InitFeathersEvent.INIT_FEATHERS).toCommand(InitFeathersCommand);
			map(AppEvent.CLOSE_APPLICATION).toCommand(CloseApplicationCommand);
			map(AppEvent.START_NEW_GAME).toCommand(NewGameCommand);
			map(StartWorldEvent.START_WORLD).toCommand(StartWorldCommand);
			map(StartRegionEvent.START_REGION).toCommand(StartRegionCommand);
			
			map(HeroServiceEvent.LOAD_STATE).toCommand(HeroLoadCommand);
			map(HeroServiceEvent.SAVE_STATE).toCommand(HeroSaveCommand);
		}
		
		private function mapMediators():void
		{
			map(AppViewMediator).toMediate(AppView);
			map(MainMenuScreenMediator).toMediate(MainMenuScreen);
			map(BackpackScreenMediator).toMediate(BackpackScreen);
			map(CommunicatorScreenMediator).toMediate(CommunicatorScreen);
			map(BattleScreenMediator).toMediate(BattleScreen);
			map(BriefingScreenMediator).toMediate(BriefingScreen);
			map(RegionScreenMediator).toMediate(RegionScreen);
			map(HeroScreenMediator).toMediate(PersonageScreen);
			map(WorldScreenMediator).toMediate(WorldScreen);
			
			map(WorldMapMediator).toMediate(WorldMap);
			map(RegionMapMediator).toMediate(RegionMap);
		}
	}
}
