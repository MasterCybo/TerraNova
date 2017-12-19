/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.TiledColumnsLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.utils.Assets;
	
	public class LoaderScreen extends Screen
	{
		public function LoaderScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			Assets.me.enqueue();
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
//				_toolbar.y = stage.stageHeight - _toolbar.height;
			}
		}
	}
}
