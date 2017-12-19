package ru.aa.game.commands
{
	import feathers.themes.TopcoatLightMobileTheme;
	
	import flash.events.Event;
	
	import ru.aa.game.display.screens.ScreenName;
	
	import ru.aa.game.display.screens.events.ScreenEvent;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class StartupCommand extends Command
	{
		public function StartupCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			new TopcoatLightMobileTheme();
//			new MetalWorksMobileTheme();
			
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
		}
	}
}
