/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	
	import ru.aa.game.core.display.controls.TextButton;
	import ru.aa.game.core.display.text.AppLabel;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.models.world.IWorld;
	
	public class WorldScreen extends Screen
	{
		public static const BUTTON_MAIN_MENU:String = "mainMenuButton";
		public static const BUTTON_COMMUNICATOR:String = "communicatorButton";
		public static const BUTTON_BACKPACK:String = "backpackButton";
		public static const BUTTON_PERSONAGE:String = "personageButton";
		
		private var _world:IWorld;
		
		private var _map:WorldMap;
		private var _toolbar:LayoutGroup;
		private var _titleWorld:AppLabel;
		
		public function WorldScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_map = new WorldMap();
			addChild(_map);
			
			_titleWorld = new AppLabel();
			addChild(_titleWorld);
			
			var layoutMenu:HorizontalLayout = new HorizontalLayout();
			layoutMenu.gap = 5;
			
			_toolbar = new LayoutGroup();
			_toolbar.layout = layoutMenu;
			
			_toolbar.addChild(new TextButton("Меню", BUTTON_MAIN_MENU));
			_toolbar.addChild(new TextButton("КПК", BUTTON_COMMUNICATOR));
			_toolbar.addChild(new TextButton("Персонаж", BUTTON_PERSONAGE));
			_toolbar.addChild(new TextButton("Рюкзак", BUTTON_BACKPACK));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_world = null;
		}
		
		public function set world(value:IWorld):void
		{
			_world = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_DATA)) {
				_map.world = _world;
				_titleWorld.text = "Территория: " + _world.name;
			}
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
				
				_map.width = stage.stageWidth;
				_map.height = _toolbar.y;
				
				
//				_titleWorld.y = 55;
			}
		}
	}
}
