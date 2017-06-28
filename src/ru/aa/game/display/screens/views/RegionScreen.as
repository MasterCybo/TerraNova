/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.display.screens.region.RegionMap;
	import ru.aa.game.models.region.IRegion;
	
	public class RegionScreen extends Screen
	{
		public static const BUTTON_LEAVE:String = "buttonLeave";
		
		private var _region:IRegion;
		private var _toolbar:LayoutGroup;
		private var _regionMap:RegionMap;
		
		public function RegionScreen()
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
			
			_toolbar.addChild(new TextButton("Свалить", BUTTON_LEAVE));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			_regionMap = new RegionMap();
			addChild(_regionMap);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_region = null;
		}
		
		public function set region(region:IRegion):void
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
