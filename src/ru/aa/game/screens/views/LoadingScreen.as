/**
 * Created by Artem-Home on 14.02.2017.
 */
package ru.aa.game.screens.views
{
	import aze.motion.eaze;
	
	import feathers.controls.ImageLoader;
	import feathers.controls.Screen;
	
	import ru.aa.game.collections.Files;
	import ru.aa.game.screens.data.LoadingScreenAction;
	import ru.aa.game.screens.events.LoadingActionEvent;
	
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
			_image.alpha = 0;
			_image.addEventListener(Event.COMPLETE, imageCompleteHandler);
			_image.source = Files.LOADING_01;
			_image.width = stage.stageWidth;
			_image.height = stage.stageHeight;
			addChild(_image);
		}
		
		private function imageCompleteHandler(event:Event):void
		{
			eaze(_image).to(0.2, {alpha:1}).onComplete(executeAction);
		}
		
		private function executeAction():void {
			data.addEventListener(LoadingActionEvent.COMPLETE, completeHandler);
			data.addEventListener(LoadingActionEvent.PROGRESS, progressHandler);
			data.execute();
		}
		
		private function progressHandler(event:LoadingActionEvent):void
		{
			trace("...loading: " + Math.round(event.ratio * 100) + " %");
		}
		
		private function completeHandler(event:LoadingActionEvent):void
		{
			data.removeEventListener(LoadingActionEvent.PROGRESS, progressHandler);
			data.removeEventListener(LoadingActionEvent.COMPLETE, completeHandler);
			
			eaze(_image).to(0.2, {alpha:0}).onComplete(executeComplete);
		}
		
		private function executeComplete():void {
			removeChild(_image, true);
			dispatchEvent(new Event(COMPLETE, true, data.nextScreenName));
		}
	}
}
