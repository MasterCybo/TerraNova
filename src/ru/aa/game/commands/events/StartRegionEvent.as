/**
 * Created by Artem-Home on 22.02.2017.
 */
package ru.aa.game.commands.events
{
	import flash.events.Event;
	
	public class StartRegionEvent extends Event
	{
		public static const START_REGION:String = "startRegionEvent";
		public static const READY_REGION:String = "readyRegionEvent";
		
		public function StartRegionEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new StartRegionEvent(type, bubbles, cancelable);
		}
	}
}
