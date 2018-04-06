/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.location.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.location.models.ILocation;
	
	public class LocationScreen extends Screen
	{
		public static const BUTTON_LEAVE:String = "buttonLeave";
		
		private var _region:ILocation;
		private var _toolbar:LayoutGroup;
		private var _regionMap:LocationMap;
		
		public function LocationScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_regionMap = new LocationMap();
			addChild(_regionMap);
			
			var layoutMenu:HorizontalLayout = new HorizontalLayout();
			layoutMenu.gap = 10;
			
			_toolbar = new LayoutGroup();
			_toolbar.layout = layoutMenu;
			
			_toolbar.addChild(new TextButton("Домой", BUTTON_LEAVE));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_region = null;
		}
		
		public function set region(region:ILocation):void
		{
			_region = region;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
				_regionMap.setSize(stage.stageWidth, stage.stageHeight - _toolbar.height);
			}
			
			if (isInvalid(INVALIDATION_FLAG_DATA)) {
				if (_region) _regionMap.region = _region;
			}
		}
	}
}
