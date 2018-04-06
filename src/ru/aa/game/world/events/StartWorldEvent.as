/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.world.events
{
	import flash.events.Event;
	
	public class StartWorldEvent extends Event
	{
		public static const START_WORLD:String = "startWorldEvent";
		
		public function StartWorldEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new StartWorldEvent(type, bubbles, cancelable);
		}
	}
}
