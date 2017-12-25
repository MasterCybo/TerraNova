/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands.events
{
	import starling.events.Event;
	
	public class AppEvent extends Event
	{
		public static const STARTUP_APPLICATION:String = "initApplicationEvent";
		public static const CLOSE_APPLICATION:String = "closeApplicationEvent";
		public static const BEGIN_NEW_GAME:String = "startNewGameEvent";
		
		public function AppEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	}
}
