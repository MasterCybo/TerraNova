package ru.aa.game.screens.data
{
	import flash.events.EventDispatcher;
	
	import ru.aa.game.screens.events.LoadingActionEvent;
	
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
			dispatchEvent(new LoadingActionEvent(LoadingActionEvent.PROGRESS, ratio));
			if (ratio == 1.0) {
				complete();
			}
		}
		
		protected function complete():void
		{
			dispatchEvent(new LoadingActionEvent(LoadingActionEvent.COMPLETE));
		}
	}
}
