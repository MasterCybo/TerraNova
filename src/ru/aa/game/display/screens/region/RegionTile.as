/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.display.screens.region
{
	import aze.motion.easing.Quadratic;
	import aze.motion.eaze;
	
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import starling.textures.Texture;
	
	public class RegionTile extends AppSprite
	{
		public static const TWEEN_DURATION:Number = 0.1;
		
		private var _texTerrain:Texture;
		private var _texFog:Texture;
		private var _terrain:ImageAsset;
		private var _fog:ImageAsset;
		
		public function RegionTile(terrainTexture:Texture, fogTexture:Texture)
		{
			super();
			_texTerrain = terrainTexture;
			_texFog = fogTexture;
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			_terrain = new ImageAsset(_texTerrain);
			_terrain.name = "terrain";
			_fog = new ImageAsset(_texFog);
			_fog.name = "fog";
			_fog.touchable = true;
			
			addChild(_terrain);
			addChild(_fog);
			
			applySize();
			
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override public function dispose():void
		{
			removeEventListener(TouchEvent.TOUCH, touchHandler);
			super.dispose();
			_texTerrain = null;
			_texFog = null;
		}
		/*
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			
			if (!touch || (touch.phase != TouchPhase.ENDED && touch.phase != TouchPhase.BEGAN)) return;
			
			var isSelf:Boolean = stage.hitTest(touch.getLocation(stage)) == this;
			
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
		}*/
		
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			
			if (!touch || (touch.phase != TouchPhase.ENDED && touch.phase != TouchPhase.BEGAN)) return;
			
			var isSelf:Boolean = stage.hitTest(touch.getLocation(stage)) == _fog;
			
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
			eaze(_fog).to(TWEEN_DURATION, {scaleX:0.85, scaleY:0.85}).easing(Quadratic.easeOut);
		}
		
		private function animationRelease():void
		{
			eaze(_fog).to(TWEEN_DURATION, {scaleX:1.2, scaleY:1.2, alpha: 0}).easing(Quadratic.easeIn);
		}
		
		override protected function applySize():void
		{
			if (!_fog) return;
			_terrain.readjustSize(_width, _height);
			_fog.readjustSize(_width, _height);
			
			_terrain.x = _terrain.pivotX = _width / 2;
			_terrain.y = _terrain.pivotY = _height / 2;
			
			_fog.x = _fog.pivotX = _width / 2;
			_fog.y = _fog.pivotY = _height / 2;
		}
	}
}
