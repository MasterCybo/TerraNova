package ru.aa.game.configs
{
	import ru.aa.game.display.ScreenContainer;
	import ru.aa.game.display.region.RegionMap;
	import ru.aa.game.display.screens.mediators.BackpackScreenMediator;
	import ru.aa.game.display.screens.mediators.BattleScreenMediator;
	import ru.aa.game.display.screens.mediators.BriefingScreenMediator;
	import ru.aa.game.display.screens.mediators.CommunicatorScreenMediator;
	import ru.aa.game.display.screens.mediators.HeroScreenMediator;
	import ru.aa.game.display.screens.mediators.MainMenuScreenMediator;
	import ru.aa.game.display.screens.mediators.RegionScreenMediator;
	import ru.aa.game.display.screens.mediators.WorldScreenMediator;
	import ru.aa.game.display.screens.views.BackpackScreen;
	import ru.aa.game.display.screens.views.BattleScreen;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.display.screens.views.CommunicatorScreen;
	import ru.aa.game.display.screens.views.HeroScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.display.screens.views.WorldScreen;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.mediators.RegionMapMediator;
	import ru.aa.game.mediators.ScreenContainerMediator;
	import ru.aa.game.mediators.WorldMapMediator;
	import ru.arslanov.starling.mvc.config.Config;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class MediatorsConfig extends Config
	{
		public function MediatorsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function configure():void
		{
			super.configure();
			
			mediatorMap.map(ScreenContainer).toMediator(ScreenContainerMediator);
			mediatorMap.map(MainMenuScreen).toMediator(MainMenuScreenMediator);
			mediatorMap.map(BackpackScreen).toMediator(BackpackScreenMediator);
			mediatorMap.map(CommunicatorScreen).toMediator(CommunicatorScreenMediator);
			mediatorMap.map(BattleScreen).toMediator(BattleScreenMediator);
			mediatorMap.map(BriefingScreen).toMediator(BriefingScreenMediator);
			mediatorMap.map(RegionScreen).toMediator(RegionScreenMediator);
			mediatorMap.map(HeroScreen).toMediator(HeroScreenMediator);
			mediatorMap.map(WorldScreen).toMediator(WorldScreenMediator);
			
			mediatorMap.map(WorldMap).toMediator(WorldMapMediator);
			mediatorMap.map(RegionMap).toMediator(RegionMapMediator);
		}
	}
}
