package ru.aa.game.common.items.views
{
	import feathers.controls.ScrollContainer;
	import feathers.controls.ScrollInteractionMode;
	import feathers.layout.TiledRowsLayout;
	
	import ru.aa.game.core.display.views.AppSprite;
	
	import starling.events.Event;
	
	public class ItemsGrid extends AppSprite
	{
		private var _layout:TiledRowsLayout;
		private var _slots:ScrollContainer;
		
		public function ItemsGrid()
		{
			super();
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			super.onAddedToStage(event);
			
			_layout = new TiledRowsLayout();
			_layout.typicalItemWidth = ItemView.DEFAULT_WIDTH;
			_layout.typicalItemHeight = ItemView.DEFAULT_HEIGHT;
			_layout.useSquareTiles = true;
//			_layout.distributeWidths = width;
			_layout.requestedColumnCount = 6;
			_layout.padding = 10;
			_layout.gap = 5;
//			_layout.paging = Direction.VERTICAL;
			
			_slots = new ScrollContainer();
			_slots.layout = _layout;
			_slots.interactionMode = ScrollInteractionMode.TOUCH_AND_SCROLL_BARS;
			
			addChild(_slots);
		}
		
		public function addItem(item:ItemView):void
		{
			_slots.addChild(item);
		}
		
		public function removeItem(item:ItemView):void
		{
			_slots.removeChild(item);
		}
		
		override protected function applySize():void
		{
			super.applySize();
			
			_slots.width = _width;
			_slots.height = _height;
		}
	}
}
