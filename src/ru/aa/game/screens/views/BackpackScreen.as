/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	
	import ru.aa.game.common.items.views.ItemView;
	import ru.aa.game.common.items.views.ItemsGrid;
	import ru.aa.game.core.display.controls.IconButton;
	import ru.aa.game.core.utils.Assets;
	
	/**
	 * Экран рюкзака
	 */
	public class BackpackScreen extends Screen
	{
		public static const BUTTON_BACK:String = "backButton";
		
		private var _toolbar:LayoutGroup;
		private var _itemsGrid:ItemsGrid;
		
		public function BackpackScreen()
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
			
			_toolbar.addChild(new IconButton(Assets.me.getTexture("back"), BUTTON_BACK));
			_toolbar.validate();
			
			_itemsGrid = new ItemsGrid();
			
			addChild(_itemsGrid);
			addChild(_toolbar);
			
			for (var i:int = 0; i < 86; i++) {
				var itemView:ItemView = new ItemView(null);
				_itemsGrid.addItem(itemView);
			}
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
				_itemsGrid.setSize(stage.stageWidth, stage.stageHeight - _toolbar.height);
			}
		}
	}
}
