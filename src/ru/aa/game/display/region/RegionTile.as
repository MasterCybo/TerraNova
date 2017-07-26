/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.display.region
{
	import aze.motion.EazeTween;
	import aze.motion.easing.Quadratic;
	import aze.motion.eaze;
	
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.display.screens.events.TileEvent;
	
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
		
		private var _centerX:Number = 0;
		private var _centerY:Number = 0;
		
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
		
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			
			if (!touch || (touch.phase != TouchPhase.ENDED && touch.phase != TouchPhase.BEGAN)) return;
			
			var isSelf:Boolean = stage.hitTest(touch.getLocation(stage)) == _fog;
			
			switch (touch.phase) {
				case TouchPhase.BEGAN:
					animatePress();
					break;
				case TouchPhase.ENDED:
					if (isSelf) {
						dispatchEvent(new TileEvent(TileEvent.TAP, true));
					} else {
						animateLocked();
					}
					break;
			}
		}
		
		public function open():void
		{
			animateOpen();
		}
		
		override protected function applySize():void
		{
			if (!_fog) return;
			_terrain.readjustSize(_width, _height);
			_fog.readjustSize(_width, _height);
			
			_centerX = _width / 2;
			_centerY = _height / 2;
			
			_terrain.x = _terrain.pivotX = _centerX;
			_terrain.y = _terrain.pivotY = _centerY;
			
			_fog.x = _fog.pivotX = _terrain.x;
			_fog.y = _fog.pivotY = _terrain.y;
		}
		
		private function animatePress():EazeTween
		{
			return eaze(_fog).to(TWEEN_DURATION, {scale:0.95}).easing(Quadratic.easeOut);
		}
		
		private function animateLocked():EazeTween
		{
			var duration:Number = 0.025;
			return eaze(_fog)
					.to(duration, {x:_centerX - 5})
					.to(duration, {x:_centerX + 2.5})
					.to(duration, {x:_centerX})
					.to(TWEEN_DURATION, {scaleX:1.0, scaleY:1.0}).easing(Quadratic.easeOut);
		}
		
		private function animateOpen():EazeTween
		{
			return eaze(_fog).to(TWEEN_DURATION, {scale:1.2, alpha: 0}).easing(Quadratic.easeIn);
		}
	}
}