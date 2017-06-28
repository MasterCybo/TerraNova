/**
 * Created by Artem-Home on 25.02.2017.
 */
package ru.aa.game.display.screens.region
{
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.models.region.IRegion;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class RegionMap extends AppSprite
	{
		public static const SPRITES_XML:String = "res/atlases/sprites.xml";
		public static const SPRITES_PNG:String = "res/atlases/sprites.png";
		public static const TEX_NAMES:Vector.<String> = Vector.<String>(["flora", "sand", "mountain", "water", "buildings"]);
		public static const TEX_FOG:String = "fog";
		
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
			
			_assets.enqueue(SPRITES_XML);
			_assets.enqueue(SPRITES_PNG);
			_assets.enqueueWithName(_region.imageURL, "background");
			_assets.loadQueue(loadingHandler);
		}
		
		private function loadingHandler(ratio:Number):void
		{
			if (ratio == 1.0) {
				_assetsLoaded = true;
				drawField();
			}
		}
		
		private function drawField():void
		{
			if (!_assetsLoaded) return;
			
			_background.texture = _assets.getTexture("background");
			
			var tile:RegionTile;
			var terrainIndex:int;
			for (var i:int = 0; i < _rows; i++) {
				for (var j:int = 0; j < _cols; j++) {
					terrainIndex = int(Math.random() * (TEX_NAMES.length - 1));
					
					tile = new RegionTile(_assets.getTexture(TEX_NAMES[terrainIndex]), _assets.getTexture(TEX_FOG));
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
			for (var i:int = 0; i < _rows; i++) {
				for (var j:int = 0; j < _cols; j++) {
					idx = i * _cols + j;
					tile = _tiles[idx];
					tile.setSize(widthTile, heightTile);
					tile.x = j * widthTile;
					tile.y = i * heightTile;
					if (!_tilesContainer.contains(tile)) _tilesContainer.addChild(tile);
				}
			}
		}
	}
}
