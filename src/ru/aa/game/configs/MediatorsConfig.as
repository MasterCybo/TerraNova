package ru.aa.game.configs
{
	import ru.aa.game.display.AppView;
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
	import ru.aa.game.mediators.AppViewMediator;
	import ru.aa.game.mediators.RegionMapMediator;
	import ru.aa.game.mediators.WorldMapMediator;
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class MediatorsConfig extends Config
	{
		public function MediatorsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			map(AppView).toMediator(AppViewMediator);
			map(MainMenuScreen).toMediator(MainMenuScreenMediator);
			map(BackpackScreen).toMediator(BackpackScreenMediator);
			map(CommunicatorScreen).toMediator(CommunicatorScreenMediator);
			map(BattleScreen).toMediator(BattleScreenMediator);
			map(BriefingScreen).toMediator(BriefingScreenMediator);
			map(RegionScreen).toMediator(RegionScreenMediator);
			map(HeroScreen).toMediator(HeroScreenMediator);
			map(WorldScreen).toMediator(WorldScreenMediator);
			
			map(WorldMap).toMediator(WorldMapMediator);
			map(RegionMap).toMediator(RegionMapMediator);
		}
	}
}
