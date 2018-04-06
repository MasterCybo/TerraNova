/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	
	import ru.aa.game.collections.Files;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.core.utils.Assets;
	
	public class MainMenuScreen extends Screen
	{
		public static const BUTTON_THE_GAME:String = "theGameButton";
		public static const BUTTON_QUIT:String = "quitButton";
		
		public function MainMenuScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var layoutScreen:VerticalLayout = new VerticalLayout();
			layoutScreen.horizontalAlign = HorizontalAlign.CENTER;
			layoutScreen.verticalAlign = VerticalAlign.MIDDLE;
			layout = layoutScreen;
			
			var layoutMenu:VerticalLayout = new VerticalLayout();
			layoutMenu.gap = 10;
			layoutMenu.horizontalAlign = HorizontalAlign.CENTER;
			
			var groupButtons:LayoutGroup = new LayoutGroup();
			groupButtons.layout = layoutMenu;
			
			groupButtons.addChild(new TextButton("Игра", BUTTON_THE_GAME));
			groupButtons.addChild(new TextButton("Выход", BUTTON_QUIT));
			
			addChild(groupButtons);
			
			Assets.me.enqueue(Files.UI_ICONS_XML);
			Assets.me.enqueue(Files.UI_ICONS_PNG);
			Assets.me.loadQueue(loadingHandler);
		}
		
		private function loadingHandler(ratio:Number):void
		{
			trace("ratio: " + ratio);
//			_assetsLoaded = ratio == 1.0;
//			if (_assetsLoaded) drawField();
		}
	}
}
