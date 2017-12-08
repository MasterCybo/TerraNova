/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.models.world
{
	import flash.utils.Dictionary;
	
	import ru.aa.game.core.data.MoEntity;
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.models.region.MoRegion;
	import ru.aa.game.models.utils.RegionRandomFactory;
	
	/**
	 * Игровой мир со списком локаций
	 */
	public class MoWorld extends MoEntity implements IWorld
	{
		private var _regions:Vector.<IRegion> = new Vector.<IRegion>();
		private var _mapRegions:Dictionary = new Dictionary();
		
		private var _cols:int;
		private var _rows:int;
		private var _imageURL:String;
		private var _dataURL:String;
		
		public function MoWorld(dataURL:String)
		{
			super();
			_dataURL = dataURL;
		}
		
		public function get imageURL():String { return _imageURL; }
		public function get dataURL():String { return _dataURL; }
		
		public function get cols():int { return _cols; }
		public function get rows():int { return _rows; }
		
		public function getRegion(id:String):IRegion
		{
			return _mapRegions[id];
		}
		
		public function getRegionAt(col:int, row:int):IRegion
		{
			return _regions[getIndex(col, row)];
		}
		
		private function getIndex(col:int, row:int):int
		{
			return _cols * row + col;
		}
		
		override public function toString():String
		{
			return className
					+ "\n\tid: " + id
					+ "\n\tname: " + name
					+ "\n\tdescription: " + description
					+ "\n\timage: " + _imageURL
					+ "\n\tcols: " + _cols
					+ "\n\trows: " + _rows;
		}
		
		/*
			Serialization
		 */
		public function deserialize(json:String):void
		{
			var data:Object = JSON.parse(json);
			__id = data["id"];
			name = data["name"];
			description = data["description"];
			_imageURL = data["image"];
			_cols = data["cols"];
			_rows = data["rows"];
			
			var totalRegions:int = _cols * _rows;
			
			var regionData:Object;
			var moRegion:MoRegion;
			var regions:Array = data["regions"];
			var numAreas:int = regions.length;
			
			for (var i:int = 0; i < totalRegions; i++) {
				moRegion = new MoRegion();
				
				if (i < numAreas) {
					regionData = regions[i];
					moRegion.parse(regionData);
				} else {
					moRegion.parse(RegionRandomFactory.getRegionData("" + i));
				}
				
				_regions.push(moRegion);
				_mapRegions[moRegion.id] = moRegion;
			}
		}
		
		public function serialize():String
		{
			var data:Object = {
				id: id,
				name: name,
				description: description,
				image: _imageURL,
				cols:_cols,
				rows:_rows
			};
			return JSON.stringify(data);
		}
	}
}
