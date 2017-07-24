/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.display.world
{
	import feathers.controls.AutoSizeMode;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollContainer;
	import feathers.controls.ScrollInteractionMode;
	import feathers.controls.ScrollPolicy;
	
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.display.views.AppSprite;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.models.world.IWorld;
	
	public class WorldMap extends ScrollContainer
	{
		private var _assets:Assets = new Assets();
		
		private var _world:IWorld;
		
		private var _background:ImageAsset;
		private var _tilesContainer:AppSprite;
		private var _tilesMap:Object= {};
		private var _cols:int;
		private var _rows:int;
		
		public function WorldMap()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			autoSizeMode = AutoSizeMode.STAGE;
			interactionMode = ScrollInteractionMode.TOUCH;
			scrollBarDisplayMode = ScrollBarDisplayMode.FLOAT;
//			horizontalScrollPolicy = ScrollPolicy.ON;
			verticalScrollPolicy = ScrollPolicy.OFF;
			
//			minimumDragDistance = 0.04; // default
			
			_background = new ImageAsset();
			_background.assetManager = _assets;
			addChild(_background);
			
			_tilesContainer = new AppSprite();
			addChild(_tilesContainer);
			
			clearInvalidationFlag(INVALIDATION_FLAG_DATA);
			
			invalidate(INVALIDATION_FLAG_SIZE);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_world = null;
			_tilesMap = null;
		}
		
		public function set world(value:IWorld):void
		{
			_world = value;
			_cols = _world.cols;
			_rows = _world.rows;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			super.draw();
			
			if (isInvalid(INVALIDATION_FLAG_SIZE)) {
				_background.autoReadjustSize(width, height);
			}
			
			if (isInvalid(INVALIDATION_FLAG_DATA)) {
				if (_world) _background.load(_world.imageURL, onLoadComplete);
			}
		}
		
		private function onLoadComplete():void
		{
			invalidate(INVALIDATION_FLAG_SIZE);
			readjustLayout();
			drawLocations();
		}
		
		private function drawLocations():void
		{
			_tilesContainer.removeChildren();
			
			var tileWidth:int = _background.width / _cols;
			var tileHeight:int = _background.height / _rows;
			
			var tile:WorldTile;
			var index:int;
			for (var row:int = 0; row < _rows; row++) {
				for (var col:int = 0; col < _cols; col++) {
					index = getIndex(col, row);
					tile = _tilesMap[index];
					if (!tile) {
						tile = new WorldTile("" + index);
						tile.setSize(tileWidth, tileHeight);
						_tilesContainer.addChild(tile);
						_tilesMap[index] = tile;
					}
					tile.x = col * tileWidth;
					tile.y = row * tileHeight;
				}
			}
		}
		
		private function getIndex(col:int, row:int):int
		{
			return _cols * row + col;
		}
		
		public function getTile(col:int, row:int):WorldTile
		{
			return _tilesMap[getIndex(col, row)];
		}
	}
}
