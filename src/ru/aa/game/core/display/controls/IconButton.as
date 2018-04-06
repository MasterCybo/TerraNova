package ru.aa.game.core.display.controls
{
	import feathers.controls.ButtonState;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;
	
	public class IconButton extends AppButton
	{
		private var _icon:Texture;
		
		public function IconButton(icon:Texture, name:String)
		{
			_icon = icon;
			super(name);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			defaultIcon = new Image(_icon);
			defaultIcon.width = 40;
			defaultIcon.height = 40;
			
			var quad:Quad = new Quad(defaultIcon.width, defaultIcon.height);
			quad.alpha = 0;
			
			setSkinForState(ButtonState.UP, quad);
			setSkinForState(ButtonState.DOWN, quad);
			setSkinForState(ButtonState.HOVER, quad);
			setSkinForState(ButtonState.DISABLED, quad);
		}
	}
}
