package ru.aa.game.display.screens.events
{
	import flash.events.Event;
	
	public class LoadingEvent extends Event
	{
		public static const COMPLETE:String = "completeLoadingEvent";
		public static const PROGRESS:String = "progressLoadingEvent";
		
		private var _ratio:Number = 0;
		
		public function LoadingEvent(type:String, ratio:Number = 1)
		{
			_ratio = ratio;
			super(type, true);
		}
		
		public function get ratio():Number {return _ratio;}
	}
}
