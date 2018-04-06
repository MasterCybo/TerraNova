/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.Screen;
	
	import ru.aa.game.core.utils.Assets;
	
	public class LoaderScreen extends Screen
	{
		private var _progress:Number = 0;
		
		public function LoaderScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			Assets.me.enqueue();
		}
		
		public function set progress(value:Number):void
		{
			if (value == _progress) return;
			_progress = value;
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
