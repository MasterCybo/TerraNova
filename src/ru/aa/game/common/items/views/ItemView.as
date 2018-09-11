package ru.aa.game.common.items.views
{
	import ru.aa.game.common.items.models.MoItem;
	import ru.aa.game.core.display.views.AppSprite;
	
	import starling.display.Canvas;
	import starling.events.Event;
	
	/**
	 * Базовый класс для отображения игрового предмета
	 */
	public class ItemView extends AppSprite
	{
		public static const DEFAULT_WIDTH:int = 70;
		public static const DEFAULT_HEIGHT:int = 70;
		
		private var _item:MoItem;
		
		public function ItemView(item:MoItem)
		{
			_item = item;
			super();
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			super.onAddedToStage(event);
			
			var image:Canvas = new Canvas();
			image.beginFill(Math.round(0xFFFFFF * Math.random()));
			image.drawRectangle(0, 0, DEFAULT_WIDTH, DEFAULT_HEIGHT);
			image.endFill();
			addChild(image);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_item = null;
		}
	}
}
