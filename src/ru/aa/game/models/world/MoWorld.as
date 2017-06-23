/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.models.world
{
	import flash.utils.Dictionary;
	
	import ru.aa.game.core.data.MoEntity;
	import ru.aa.game.models.utils.AreaRandomFactory;
	
	public class MoWorld extends MoEntity implements IWorld
	{
		private var _areas:Vector.<MoArea> = new Vector.<MoArea>();
		private var _map:Dictionary = new Dictionary();
		
		private var _cols:int;
		private var _rows:int;
		private var _imageURL:String;
		
		public function MoWorld()
		{
			super();
		}
		
		public function get imageURL():String { return _imageURL; }
		
		public function get cols():int { return _cols; }
		public function get rows():int { return _rows; }
		
		public function getArea(id:String):MoArea
		{
			return _map[id];
		}
		
		public function getAreaAt(col:int, row:int):MoArea
		{
			return _areas[getIndex(col, row)];
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
			id = data.id;
			name = data.name;
			description = data.description;
			_imageURL = data.image;
			_cols = data.cols;
			_rows = data.rows;
			
			var totalAreas:int = _cols * _rows;
			
			var areaData:Object;
			var moArea:MoArea;
			var areas:Array = data.areas;
			var numAreas:int = areas.length;
			
			for (var i:int = 0; i < totalAreas; i++) {
				moArea = new MoArea();
				
				if (i < numAreas) {
					areaData = areas[i];
					moArea.parse(areaData);
				} else {
					moArea.parse(AreaRandomFactory.getAreaData("" + i));
				}
				
				_areas.push(moArea);
				_map[moArea.id] = moArea;
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
