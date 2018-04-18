package ru.aa.game.gui
{
	import feathers.themes.TopcoatLightMobileTheme;
	
	public class AppTheme extends TopcoatLightMobileTheme
	{
		public function AppTheme()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
//			Starling.current.stage.color = 0x000000;
		}
	}
}
