/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.display.screens.events
{
	import starling.events.Event;
	
	public class ScreenEvent extends Event
	{
		public static const SHOW_SCREEN:String = "showScreenEvent";
		public static const SHOW_PREVIOUS:String = "showPreviousEvent";
		
		private var _name:String;
		
		public function ScreenEvent(type:String, name:String = null, data:Object = null)
		{
			super(type, false, data);
			_name = name;
		}
		
		public function get name():String { return _name; }
	}
}
