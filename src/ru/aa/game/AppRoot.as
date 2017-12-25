package ru.aa.game
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AppRoot extends Sprite
	{
		public function AppRoot()
		{
			super();
			
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void
		{
			addChild(new AppScreenNavigator());
		}
	}
}
