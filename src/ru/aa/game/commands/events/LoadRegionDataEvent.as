/**
 * Created by Artem-Home on 22.02.2017.
 */
package ru.aa.game.commands.events
{
	import flash.events.Event;
	
	public class LoadRegionDataEvent extends Event
	{
		public static const LOAD_REGION_DATA:String = "loadRegionDataEvent";
		
		public function LoadRegionDataEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LoadRegionDataEvent(type, bubbles, cancelable);
		}
	}
}
