/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.commands
{
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.themes.TopcoatLightMobileTheme;
	
	import flash.events.Event;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class InitFeathersCommand extends Command
	{
		public function InitFeathersCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			new TopcoatLightMobileTheme();
//			new MetalWorksMobileTheme();
		}
	}
}
