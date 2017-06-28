/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.display.world
{
	import aze.motion.easing.Quadratic;
	import aze.motion.eaze;
	
	import flash.geom.Point;
	
	import flash.geom.Rectangle;
	
	import ru.aa.game.core.display.views.AppSprite;
	
	import starling.display.Canvas;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class AreaTile extends AppSprite
	{
		public static const TWEEN_DURATION:Number = 0.1;
		
		private var _normalCanvas:Canvas;
		
		public function AreaTile(name:String)
		{
			super();
			this.name = name;
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			_normalCanvas = new Canvas();
			addChild(_normalCanvas);
			
			applySize();
			
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override public function dispose():void
		{
			removeEventListener(TouchEvent.TOUCH, touchHandler);
			super.dispose();
		}
		
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			
			if (!touch || (touch.phase != TouchPhase.ENDED && touch.phase != TouchPhase.BEGAN)) return;
			
			//*/
			var isSelf:Boolean = stage.hitTest(touch.getLocation(stage)) == _normalCanvas;
//			trace("isSelf : " + isSelf);
			
			/*/
			var pt:Point = touch.getLocation(touch.target);
			trace("pt : " + pt);
			var isInBounds:Boolean = touch.target.bounds.contains(pt.x, pt.y);
			
			trace("touch.target : " + touch.target);
			trace("touch.target.bounds : " + touch.target.bounds);
			trace("isInBounds : " + isInBounds);
			//*/
			
			if (touch.phase == TouchPhase.ENDED) animationRelease();
			
			if (!isSelf) {
				event.stopImmediatePropagation();
				event.stopPropagation();
				return;
			}
			
			if (touch.phase == TouchPhase.BEGAN) animationPress();
			
			removeEventListener(TouchEvent.TOUCH, touchHandler);
			dispatchEvent(event);
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		private function animationPress():void
		{
			eaze(_normalCanvas).to(TWEEN_DURATION, {scaleX:0.85, scaleY:0.85}).easing(Quadratic.easeOut);
		}
		
		private function animationRelease():void
		{
			eaze(_normalCanvas).to(TWEEN_DURATION, {scaleX:1.0, scaleY:1.0}).easing(Quadratic.easeIn);
		}
		
		override protected function applySize():void
		{
			if (_normalCanvas) {
				_normalCanvas.clear();
				_normalCanvas.beginFill(0xFFFFFF, 0.1);
				_normalCanvas.drawRectangle(0, 0, _width - 1, _height - 1);
				_normalCanvas.endFill();
				
				_normalCanvas.pivotX = _normalCanvas.x = _width / 2;
				_normalCanvas.pivotY = _normalCanvas.y = _height / 2;
			}
		}
	}
}
