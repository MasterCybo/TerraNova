package ru.aa.game.display.screens.data
{
	import flash.events.EventDispatcher;
	
	import ru.aa.game.display.screens.events.LoadingEvent;
	
	public class LoadingScreenAction extends EventDispatcher
	{
		private var _nextScreen:String;
		
		public function LoadingScreenAction(nextScreen:String)
		{
			_nextScreen = nextScreen;
			super();
		}
		
		public function get nextScreenName():String {return _nextScreen;}
		
		public function execute():void
		{
			progress(1);
		}
		
		protected function progress(ratio:Number):void
		{
			dispatchEvent(new LoadingEvent(LoadingEvent.PROGRESS, ratio));
			if (ratio == 1.0) {
				complete();
			}
		}
		
		protected function complete():void
		{
			dispatchEvent(new LoadingEvent(LoadingEvent.COMPLETE));
		}
	}
}
