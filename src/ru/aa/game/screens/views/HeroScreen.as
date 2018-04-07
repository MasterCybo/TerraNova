/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.screens.views
{
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import ru.aa.game.core.display.controls.IconButton;
	import ru.aa.game.core.display.text.AppLabel;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.hero.models.MoHero;
	
	public class HeroScreen extends Screen
	{
		public static const BUTTON_BACK:String = "backButton";
		public static const BUTTON_BACKPACK:String = "backpackButton";
		
		private static const LABEL_NAME:String = "labelName";
		private static const LABEL_HEALTH:String = "labelHealth";
		private static const LABEL_ENERGY:String = "labelEnergy";
		private static const LABEL_HUNGER:String = "labelHunger";
		private static const LABEL_THIRST:String = "labelThirst";
		
		private var _player:MoHero;
		
		private var _toolbar:LayoutGroup;
		private var _playerParams:LayoutGroup;
		
		public function HeroScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
//			var layoutScreen:VerticalLayout = new VerticalLayout();
//			layoutScreen.gap = 10;
//			layout = layoutScreen;
			
			
			var layoutInfo:VerticalLayout = new VerticalLayout();
			layoutInfo.padding = 10;
			
			_playerParams = new LayoutGroup();
			_playerParams.layout = layoutInfo;
			
			_playerParams.addChild(labelParam(LABEL_NAME, " "));
			_playerParams.addChild(labelParam(LABEL_HEALTH, " "));
			_playerParams.addChild(labelParam(LABEL_ENERGY, " "));
			_playerParams.addChild(labelParam(LABEL_HUNGER, " "));
			_playerParams.addChild(labelParam(LABEL_THIRST, " "));
			_playerParams.validate();
			
			addChild(_playerParams);
			
			
			var layoutMenu:HorizontalLayout = new HorizontalLayout();
			layoutMenu.gap = 10;
			
			_toolbar = new LayoutGroup();
			_toolbar.layout = layoutMenu;
			
			_toolbar.addChild(new IconButton(Assets.me.getTexture("back"), BUTTON_BACK));
			_toolbar.addChild(new IconButton(Assets.me.getTexture("backpack"), BUTTON_BACKPACK));
			_toolbar.validate();
			
			addChild(_toolbar);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_player = null;
		}
		
		public function set player(value:MoHero):void
		{
			_player = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_DATA)) {
				labelParam(LABEL_NAME, "Имя: " + _player.name);
				labelParam(LABEL_HEALTH, "Здоровье: " + _player.health);
				labelParam(LABEL_ENERGY, "Бодрость: " + _player.energy);
				labelParam(LABEL_HUNGER, "Голод: " + _player.hunger);
				labelParam(LABEL_THIRST, "Жажда: " + _player.thirst);
			}
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_toolbar.y = stage.stageHeight - _toolbar.height;
			}
		}
		
		private function labelParam(name:String, text:String):Label
		{
			var label:Label = _playerParams.getChildByName(name) as Label;
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
