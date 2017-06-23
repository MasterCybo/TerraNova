/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.player.events
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		public static const CHANGED_HEALTH:String = "changedHealth";
		public static const CHANGED_HUNGER:String = "changedHunger";
		public static const CHANGED_THIRST:String = "changedThirst";
		public static const CHANGED_ENERGY:String = "changedEnergy";
		
		public function PlayerEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new PlayerEvent(type, bubbles, cancelable);
		}
	}
}
