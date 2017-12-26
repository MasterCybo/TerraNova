/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
	import starling.core.Starling;
	
	public class CloseApplicationCommand extends Command
	{
		public function CloseApplicationCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			Starling.current.stop();
			NativeApplication.nativeApplication.exit();
		}
	}
}
