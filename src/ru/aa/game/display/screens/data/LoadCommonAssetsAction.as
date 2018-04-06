package ru.aa.game.display.screens.data
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.core.utils.Assets;
	
	public class LoadCommonAssetsAction extends LoadingScreenAction
	{
		public function LoadCommonAssetsAction(nextScreen:String)
		{
			super(nextScreen);
		}
		
		override public function execute():void
		{
			Assets.me.enqueue(Files.UI_ICONS_XML);
			Assets.me.enqueue(Files.UI_ICONS_PNG);
			Assets.me.loadQueue(loadingHandler);
		}
		
		private function loadingHandler(ratio:Number):void
		{
			progress(ratio);
//			_assetsLoaded = ratio == 1.0;
//			if (_assetsLoaded) drawField();
		}
	}
}
