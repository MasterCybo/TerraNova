/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.world.views
{
	import aze.motion.EazeTween;
	import aze.motion.easing.Quadratic;
	import aze.motion.eaze;
	
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.screens.events.TileEvent;
	
	import starling.display.Canvas;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class WorldTile extends AppSprite
	{
		public static const TWEEN_DURATION:Number = 0.1;
		
		private var _normalCanvas:Canvas;
		
		public function WorldTile(name:String)
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
			
			var isSelf:Boolean = stage.hitTest(touch.getLocation(stage)) == _normalCanvas;
			
			switch (touch.phase) {
				case TouchPhase.BEGAN:
					animatePress();
					break;
				case TouchPhase.ENDED:
					if (isSelf) {
						animateRelease().onComplete(onReleaseComplete);
					} else {
						animateRelease();
					}
					break;
			}
		}
		
		private function onReleaseComplete():void
		{
			dispatchEvent(new TileEvent(TileEvent.TAP, true));
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
		
		private function animatePress():EazeTween
		{
			return eaze(_normalCanvas).to(TWEEN_DURATION, {scale:0.85}).easing(Quadratic.easeOut);
		}
		
		private function animateRelease():EazeTween
		{
			return eaze(_normalCanvas).to(TWEEN_DURATION, {scale:1.0}).easing(Quadratic.easeIn);
		}
	}
}
