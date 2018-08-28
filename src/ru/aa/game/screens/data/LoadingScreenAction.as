package ru.aa.game.screens.data
{
	import flash.events.EventDispatcher;
	
	import ru.aa.game.core.utils.Assets;
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
			complete(null);
		}
		
		protected function progress(ratio:Number):void
		{
			dispatchEvent(new LoadingActionEvent(LoadingActionEvent.PROGRESS, ratio));
		}
		
		protected function complete(manager:Assets):void
		{
			dispatchEvent(new LoadingActionEvent(LoadingActionEvent.COMPLETE));
		}
	}
}
