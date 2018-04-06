/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.display
{
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.views.BackpackScreen;
	import ru.aa.game.display.screens.views.BattleScreen;
	import ru.aa.game.display.screens.views.BriefingScreen;
	import ru.aa.game.display.screens.views.CommunicatorScreen;
	import ru.aa.game.display.screens.views.HeroScreen;
	import ru.aa.game.display.screens.views.LoadingScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.location.views.LocationScreen;
	import ru.aa.game.world.views.WorldScreen;
	
	public class ScreenContainer extends ScreenNavigator
	{
		public function ScreenContainer()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			setupScreenItem(LoadingScreen, 		ScreenName.LOADING_SCREEN);
			
			setupScreenItem(MainMenuScreen, 	ScreenName.MAIN_MENU);
			
			setupScreenItem(CommunicatorScreen, ScreenName.COMMUNICATOR);
			setupScreenItem(BackpackScreen, 	ScreenName.BACKPACK);
			setupScreenItem(HeroScreen, 		ScreenName.PERSONAGE);
			setupScreenItem(BriefingScreen, 	ScreenName.BRIEFING);
			
			setupScreenItem(WorldScreen, 		ScreenName.WORLD_MAP);
			setupScreenItem(LocationScreen, 	ScreenName.REGION_MAP);
			
			setupScreenItem(BattleScreen, 		ScreenName.BATTLE);
		}
		
		private function setupScreenItem(screen:Class, name:String):void
		{
			var screenItem:ScreenNavigatorItem = new ScreenNavigatorItem(screen);
			addScreen(name, screenItem);
		}
	}
}
