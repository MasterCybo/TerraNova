package ru.aa.game.commands
{
	import feathers.themes.TopcoatLightMobileTheme;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	
	import starling.events.EventDispatcher;
	
	public class StartupCommand extends Command
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;
		
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			trace("*execute* " + this + "::execute()");
			super.execute();
			
			new TopcoatLightMobileTheme();
//			new MetalWorksMobileTheme();
			
			trace("eventDispatcher: " + eventDispatcher);
			
			eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.MAIN_MENU));
		}
	}
}
