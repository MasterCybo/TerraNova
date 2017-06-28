/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.mediators
{
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
			trace("*execute* " + this + "::touchHandler()");
//			var touch:Touch = event.touches[0];
			
//			if (touch.phase == TouchPhase.ENDED) {
//				trace("event.target: " + event.target);
//				var tile:RegionTile = event.target as RegionTile;
//			}
		}
	}
}
