/**
 * Created by Artem-Home on 25.02.2017.
 */
package ru.aa.game.location.views
{
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.location.models.ILocation;
	import ru.aa.game.location.models.MoCellLocation;
	
	import starling.events.Event;
	import starling.filters.GlowFilter;
	
	public class LocationMap extends AppSprite
	{
		public static const TEX_BACKGROUND:String = "background";
		
		public static const SPACE:int = 2;
		
		private var _region:ILocation;
		private var _tiles:Vector.<LocationTile> = new Vector.<LocationTile>();
		private var _tilesContainer:AppSprite;
		private var _cols:int;
		private var _rows:int;
		private var _background:ImageAsset;
		
		public function LocationMap()
		{
			super();
		}
		
		override protected function onAddedToStage(event:Event):void
		{
			_background = new ImageAsset();
			addChild(_background);
			
			_tilesContainer = new AppSprite();
			_tilesContainer.filter = new GlowFilter(0x000000, 1, 10);
			addChild(_tilesContainer);
		}
		
		override public function dispose():void
		{
			super.dispose();
			Assets.me.removeTexture(TEX_BACKGROUND);
			_region = null;
		}
		
		public function set region(region:ILocation):void
		{
			_region = region;
			_cols = _region.cols;
			_rows = _region.rows;
			
			drawField();
		}
		
		private function drawField():void
		{
			_background.texture = Assets.me.getTexture(TEX_BACKGROUND);
			
			var tile:LocationTile;
			var moCell:MoCellLocation;
			for (var i:int = 0; i < _rows; i++) {
				for (var j:int = 0; j < _cols; j++) {
					moCell = _region.grid.getAt(j, i) as MoCellLocation;
					
					tile = new LocationTile(moCell);
					_tiles.push(tile);
				}
			}
			
			applySize();
		}
		
		override protected function applySize():void
		{
			if (!_region) return;
			
			_background.readjustSize(_width, _height);
			
			var widthTile:int = _width / _cols - SPACE * 0.5;
			var heightTile:int = _height / _rows - SPACE * 0.5;
			var tile:LocationTile;
			var idx:int;
			for (var row:int = 0; row < _rows; row++) {
				for (var col:int = 0; col < _cols; col++) {
					idx = row * _cols + col;
					tile = _tiles[idx];
					tile.setSize(widthTile, heightTile);
					tile.x = col * (widthTile + SPACE);
					tile.y = row * (heightTile + SPACE);
					if (!_tilesContainer.contains(tile)) _tilesContainer.addChild(tile);
				}
			}
		}
	}
}
