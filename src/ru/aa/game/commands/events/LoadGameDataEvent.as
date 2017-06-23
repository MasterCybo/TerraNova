/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands.events
{
	import flash.events.Event;
	
	public class LoadGameDataEvent extends Event
	{
		public static const LOAD_GAME_DATA:String = "loadGameDataEvent";
		
		public function LoadGameDataEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LoadGameDataEvent(type, bubbles, cancelable);
		}
	}
}
