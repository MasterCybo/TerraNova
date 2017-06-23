/**
 * Copyright (c) 2015 Artem Arslanov. All rights reserved.
 */
package ru.aa.game.player.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class PlayerServiceEvent extends Event {

		public static const LOAD_STATE:String = "loadPlayerState";
		public static const SAVE_STATE:String = "savePlayerState";

		public function PlayerServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new PlayerServiceEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("PlayerServiceEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}