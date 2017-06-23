/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.commands.events
{
	import flash.events.Event;
	
	public class InitFeathersEvent extends Event
	{
		public static const INIT_FEATHERS:String = "initFeathers";
		
		public function InitFeathersEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new InitFeathersEvent(type, bubbles, cancelable);
		}
	}
}
