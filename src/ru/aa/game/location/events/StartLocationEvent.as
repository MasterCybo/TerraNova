/**
 * Created by Artem-Home on 22.02.2017.
 */
package ru.aa.game.location.events
{
	import flash.events.Event;
	
	public class StartLocationEvent extends Event
	{
		public static const START_LOCATION:String = "startLocationEvent";
		
		public function StartLocationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new StartLocationEvent(type, bubbles, cancelable);
		}
	}
}
