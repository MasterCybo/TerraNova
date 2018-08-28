package ru.aa.game.screens.data
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
			Assets.me.enqueue(Files.UI_ICONS_XML, Files.UI_ICONS_PNG);
			Assets.me.loadQueue(complete, null, progress);
		}
	}
}
