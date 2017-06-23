/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const CLOSE_APPLICATION:String = "closeApplicationEvent";
		
		public function AppEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new AppEvent(type, bubbles, cancelable);
		}
	}
}
