package ru.aa.game.configs
{
	import ru.aa.game.gui.AppTheme;
	import ru.arslanov.starling.mvc.config.Config;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class FeathersConfig extends Config
	{
		public function FeathersConfig(context:IContext)
		{
			super(context);
		}
		
		override public function configure():void
		{
			super.configure();
			
			new AppTheme();
//			new MetalWorksMobileTheme();
		}
	}
}
