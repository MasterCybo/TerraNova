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
	import ru.aa.game.display.screens.views.RegionScreen;
	import ru.aa.game.display.screens.views.MainMenuScreen;
	import ru.aa.game.display.screens.views.PersonageScreen;
	import ru.aa.game.display.screens.views.WorldScreen;
	
	public class ContextView extends ScreenNavigator
	{
		public function ContextView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var screenItem:ScreenNavigatorItem = new ScreenNavigatorItem(MainMenuScreen);
			addScreen(ScreenName.MAIN_MENU, screenItem);
			
			screenItem = new ScreenNavigatorItem(WorldScreen);
			addScreen(ScreenName.WORLD_MAP, screenItem);
			
			screenItem = new ScreenNavigatorItem(CommunicatorScreen);
			addScreen(ScreenName.COMMUNICATOR, screenItem);
			
			screenItem = new ScreenNavigatorItem(BackpackScreen);
			addScreen(ScreenName.BACKPACK, screenItem);
			
			screenItem = new ScreenNavigatorItem(PersonageScreen);
			addScreen(ScreenName.PERSONAGE, screenItem);
			
			screenItem = new ScreenNavigatorItem(BriefingScreen);
			addScreen(ScreenName.BRIEFING, screenItem);
			
			screenItem = new ScreenNavigatorItem(RegionScreen);
			addScreen(ScreenName.REGION_MAP, screenItem);
			
			screenItem = new ScreenNavigatorItem(BattleScreen);
			addScreen(ScreenName.BATTLE, screenItem);
		}
	}
}
