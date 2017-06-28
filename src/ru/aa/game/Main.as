package ru.aa.game
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import ru.aa.game.AppRoot;
	
	import ru.arslanov.starling.StarlingManager;
	
	[SWF(frameRate = "60")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			StarlingManager.create(AppRoot, stage);
			StarlingManager.showStats();
		}
	}
}
