/**
 * Created by Artem-Home on 25.02.2017.
 */
package ru.aa.game.display.screens.region
{
	import ru.aa.game.core.display.image.ImageAsset;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.models.region.IRegion;
	
	import starling.display.Sprite;
	
	public class RegionMap extends Sprite
	{
		public const SPRITES_XML:String = "res/atlases/sprites.xml";
		public const SPRITES_PNG:String = "res/atlases/sprites.png";
		
		private var _assets:Assets = new Assets();
		private var _region:IRegion;
		
		public function RegionMap()
		{
			super();
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
			
			_assets.enqueue(SPRITES_XML);
			_assets.enqueue(SPRITES_PNG);
			_assets.enqueueWithName(_region.imageURL, "background");
			_assets.loadQueue(loadingHandler);
		}
		
		private function loadingHandler(ratio:Number):void
		{
			if (ratio == 1.0) {
				drawField();
			}
		}
		
		private function drawField():void
		{
			trace("*execute* " + this + "::drawField()");
			var background:ImageAsset = new ImageAsset(_assets.getTexture("background"));
			background.readjustSize(stage.stageWidth, stage.stageHeight);
			addChild(background);
			
			var names:Vector.<String> = Vector.<String>(["flora", "sand", "mountain", "water", "buildings", "fog"]);
			var tileWidth:int = width / _region.cols;
			var tileHeight:int = height / _region.rows;
			var tile:ImageAsset;
			var index:int;
			for (var i:int = 0; i < _region.rows; i++) {
				for (var j:int = 0; j < _region.cols; j++) {
					index = int(Math.random() * (names.length));
					tile = new ImageAsset();
					tile.autoReadjustSize(tileWidth, tileHeight);
					tile.texture = _assets.getTexture(names[index]);
					tile.x = j * tile.width;
					tile.y = i * tile.height;
					addChild(tile);
				}
			}
		}
	}
}
