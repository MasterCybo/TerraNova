package ru.aa.game.display.screens.events
{
	import starling.events.Event;
	
	public class TileEvent extends Event
	{
		public static const TAP:String = "tapTileEvent";
		
		public function TileEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	}
}
