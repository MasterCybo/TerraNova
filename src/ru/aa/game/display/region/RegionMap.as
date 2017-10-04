/**
 * Created by Artem-Home on 25.02.2017.
 */
package ru.aa.game.display.region
{
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.models.region.MoCellRegion;
	
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class RegionMap extends AppSprite
	{
		public static const TEX_FOG:String = "fog";
		public static const BG_NAME:String = "background";
		
		private var _assets:Assets = new Assets();
		private var _assetsLoaded:Boolean;
		private var _region:IRegion;
		private var _tiles:Vector.<RegionTile> = new Vector.<RegionTile>();
		private var _tilesContainer:AppSprite;
		private var _cols:int;
		private var _rows:int;
		private var _background:ImageAsset;
		
		public function RegionMap()
		{
			super();
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			_background = new ImageAsset();
			addChild(_background);
			
			_tilesContainer = new AppSprite();
			addChild(_tilesContainer);
		}
		
		override public function dispose():void
		{
			_assets.dispose();
			super.dispose();
			_region = null;
		}
		
		public function set region(region:IRegion):void
		{
			_region = region;
			_cols = _region.cols;
			_rows = _region.rows;
			
			_assetsLoaded = false;
			
			_assets.enqueueWithName(_region.imageURL, BG_NAME);
			
			var widthTile:int = _width / _cols;
			var heightTile:int = _height / _rows;
			_assets.addTexture(TEX_FOG, Texture.fromColor(widthTile, heightTile, 0x58707C));
			
			_assets.loadQueue(loadingHandler);
		}
		
		private function loadingHandler(ratio:Number):void
		{
			_assetsLoaded = ratio == 1.0;
			if (_assetsLoaded) drawField();
		}
		
		private function drawField():void
		{
			if (!_assetsLoaded) return;
			
			_background.texture = _assets.getTexture(BG_NAME);
			
			var tile:RegionTile;
			var cell:MoCellRegion;
			for (var i:int = 0; i < _rows; i++) {
				for (var j:int = 0; j < _cols; j++) {
					cell = _region.grid.getCellAt(j, i) as MoCellRegion;
					
					tile = new RegionTile(cell, _assets.getTexture(TEX_FOG));
					_tiles.push(tile);
				}
			}
			
			applySize();
		}
		
		override protected function applySize():void
		{
			if (!_region) return;
			
			_background.readjustSize(_width, _height);
			
			var widthTile:int = _width / _cols;
			var heightTile:int = _height / _rows;
			var tile:RegionTile;
			var idx:int;
			for (var row:int = 0; row < _rows; row++) {
				for (var col:int = 0; col < _cols; col++) {
					idx = row * _cols + col;
					tile = _tiles[idx];
					tile.setSize(widthTile, heightTile);
					tile.x = col * widthTile;
					tile.y = row * heightTile;
					if (!_tilesContainer.contains(tile)) _tilesContainer.addChild(tile);
				}
			}
		}
	}
}
