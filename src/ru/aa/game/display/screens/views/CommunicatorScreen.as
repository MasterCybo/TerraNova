/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	
	public class CommunicatorScreen extends Screen
	{
		public static const BUTTON_BACK:String = "backButton";
		
		private var _toolbar:LayoutGroup;
		
		public function CommunicatorScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var layoutMenu:HorizontalLayout = new HorizontalLayout();
			layoutMenu.gap = 10;
			
			_toolbar = new LayoutGroup();
			_toolbar.layout = layoutMenu;
			
			_toolbar.addChild(new TextButton("Назад", BUTTON_BACK));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
			}
		}
	}
}
