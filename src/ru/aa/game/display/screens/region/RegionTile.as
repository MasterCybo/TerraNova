/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.display.screens.region
{
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	
	import starling.events.Event;
	
	import starling.textures.Texture;
	
	public class RegionTile extends AppSprite
	{
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
			touchable = true;
			
			_terrain = new ImageAsset(_texTerrain);
			_fog = new ImageAsset(_texFog);
			
			addChild(_terrain);
			addChild(_fog);
			
			applySize();
		}
		
		override public function dispose():void
		{
			_texTerrain = null;
			_texFog = null;
			super.dispose();
		}
		
		override protected function applySize():void
		{
			if (!_fog) return;
			_terrain.readjustSize(_width, _height);
			_fog.readjustSize(_width, _height);
		}
	}
}
