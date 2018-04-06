/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.display.screens.views
{
	import feathers.controls.ImageLoader;
	import feathers.controls.Screen;
	
	import ru.aa.game.collections.Files;
	import ru.aa.game.display.screens.data.LoadingScreenAction;
	import ru.aa.game.display.screens.events.LoadingEvent;
	
	import starling.events.Event;
	
	public class LoadingScreen extends Screen
	{
		public static const COMPLETE:String = "loadingCompleteEvent";
		
		public var data:LoadingScreenAction;
		
		private var _image:ImageLoader;
		
		public function LoadingScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_image = new ImageLoader();
			_image.addEventListener(Event.COMPLETE, imageCompleteHandler);
			_image.source = Files.LOADING_01;
			_image.width = stage.stageWidth;
			_image.height = stage.stageHeight;
			addChild(_image);
		}
		
		private function imageCompleteHandler(event:Event):void
		{
			data.addEventListener(LoadingEvent.COMPLETE, completeHandler);
			data.addEventListener(LoadingEvent.PROGRESS, progressHandler);
			data.execute();
		}
		
		private function progressHandler(event:LoadingEvent):void
		{
			trace("event.ratio: " + event.ratio);
		}
		
		private function completeHandler(event:LoadingEvent):void
		{
			data.removeEventListener(LoadingEvent.PROGRESS, progressHandler);
			data.removeEventListener(LoadingEvent.COMPLETE, completeHandler);
			
			removeChild(_image, true);
			
			dispatchEvent(new Event(COMPLETE, true, data.nextScreenName));
		}
	}
}
