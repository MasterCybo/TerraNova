/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.display.screens.events
{
	import flash.events.Event;
	
	public class ScreenEvent extends Event
	{
		public static const SHOW_SCREEN:String = "showScreenEvent";
		public static const SHOW_PREVIOUS:String = "showPreviousEvent";
		
		private var _name:String;
		private var _data:Object;
		
		public function ScreenEvent(type:String, name:String = null, data:Object = null)
		{
			super(type, bubbles, cancelable);
			_name = name;
			_data = data;
		}
		
		public function get name():String { return _name; }
		public function get data():Object { return _data; }
		
		override public function clone():Event
		{
			return new ScreenEvent(type, name, data);
		}
	}
}
