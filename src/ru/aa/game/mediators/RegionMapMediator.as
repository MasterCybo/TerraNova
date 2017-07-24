/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.mediators
{
	import flash.utils.getTimer;
	
	import ru.aa.game.display.screens.region.RegionTile;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class RegionMapMediator extends Mediator
	{
		public function RegionMapMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			addViewListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(TouchEvent.TOUCH, touchHandler);
			super.destroy();
		}
		
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.touches[0];
			
			if (touch.phase == TouchPhase.ENDED) {
				var ts:int = getTimer() * 1000;
				trace(ts + "\tevent.target: " + event.target);
				trace("\tevent.target.name : " + (event.target as DisplayObject).name);
				trace("\ttouch.phase : " + touch.phase);
				trace("\ttouch.target : " + touch.target);
				trace("\ttouch.target.name : " + touch.target.name);
				var tile:RegionTile = event.target as RegionTile;
				trace("\tClick on tile " + tile);
			}
		}
	}
}
