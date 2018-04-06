package ru.aa.game.configs
{
	import ru.aa.game.display.ScreenContainer;
	import ru.aa.game.display.screens.mediators.BackpackScreenMediator;
	import ru.aa.game.display.screens.mediators.BattleScreenMediator;
	import ru.aa.game.display.screens.mediators.BriefingScreenMediator;
	import ru.aa.game.display.screens.mediators.CommunicatorScreenMediator;
	import ru.aa.game.display.screens.mediators.HeroScreenMediator;
	import ru.aa.game.display.screens.mediators.MainMenuScreenMediator;
	import ru.aa.game.display.screens.views.BackpackScreen;
	import ru.aa.game.display.screens.views.BattleScreen;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.display.screens.views.CommunicatorScreen;
	import ru.aa.game.display.screens.views.HeroScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.location.mediators.LocationMapMediator;
	import ru.aa.game.location.mediators.LocationScreenMediator;
	import ru.aa.game.location.views.LocationMap;
	import ru.aa.game.location.views.LocationScreen;
	import ru.aa.game.mediators.ScreenContainerMediator;
	import ru.aa.game.world.mediators.WorldMapMediator;
	import ru.aa.game.world.mediators.WorldScreenMediator;
	import ru.aa.game.world.views.WorldMap;
	import ru.aa.game.world.views.WorldScreen;
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
			mediatorMap.map(LocationScreen).toMediator(LocationScreenMediator);
			mediatorMap.map(HeroScreen).toMediator(HeroScreenMediator);
			mediatorMap.map(WorldScreen).toMediator(WorldScreenMediator);
			
			mediatorMap.map(WorldMap).toMediator(WorldMapMediator);
			mediatorMap.map(LocationMap).toMediator(LocationMapMediator);
		}
	}
}
