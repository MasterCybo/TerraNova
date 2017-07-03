/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.core.display.text.AppLabel;
	import ru.aa.game.models.region.MoRegion;
	
	public class BriefingScreen extends Screen
	{
		public static const BUTTON_BACK:String = "backButton";
		public static const BUTTON_BEGIN:String = "beginButton";
		
		private static const LABEL_TITLE:String = "labelName";
		private static const LABEL_DESCRIPTION:String = "labelDescription";
		
		private var _region:MoRegion;
		
		private var _toolbar:LayoutGroup;
		private var _info:LayoutGroup;
		
		public function BriefingScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
//			var layoutScreen:VerticalLayout = new VerticalLayout();
//			layout = layoutScreen;
			
			var layoutMenu:HorizontalLayout = new HorizontalLayout();
			layoutMenu.gap = 10;
			
			_toolbar = new LayoutGroup();
			_toolbar.layout = layoutMenu;
			
			_toolbar.addChild(new TextButton("Назад", BUTTON_BACK));
			_toolbar.addChild(new TextButton("В путь", BUTTON_BEGIN));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			var layoutInfo:VerticalLayout = new VerticalLayout();
			layoutInfo.gap = 10;
			
			_info = new LayoutGroup();
			_info.layout = layoutInfo;
			
			_info.addChild(labelParam(LABEL_TITLE, " "));
			_info.addChild(labelParam(LABEL_DESCRIPTION, " "));
			_info.validate();
			
			addChild(_info);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_region = null;
		}
		
		public function set region(value:MoRegion):void
		{
			_region = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_DATA)) {
				labelParam(LABEL_TITLE, "Область: " + _region.name);
				labelParam(LABEL_DESCRIPTION, "Описание: " + _region.description);
			}
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
			}
		}
		
		private function labelParam(name:String, text:String):Label
		{
			var label:Label = _info.getChildByName(name) as Label;
			if (label) {
				label.text = text;
			} else {
				label = new AppLabel(text);
				label.name = name;
			}
			return label;
		}
	}
}
