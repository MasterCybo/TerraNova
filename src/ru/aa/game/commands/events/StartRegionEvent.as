/**
 * Created by Artem-Home on 22.02.2017.
 */
package ru.aa.game.commands.events
{
	import starling.events.Event;
	
	public class StartRegionEvent extends Event
	{
		public static const START_REGION:String = "startRegionEvent";
		
		public function StartRegionEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	}
}
