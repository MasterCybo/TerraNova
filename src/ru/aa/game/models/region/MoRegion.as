/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.MoEntityDispatcher;
	import ru.aa.game.models.MoMission;
	import ru.aa.game.models.collections.Grid;
	
	/**
	 * Локация игрового мира
	 */
	public class MoRegion extends MoEntityDispatcher implements IRegion
	{
		private var _cols:int;
		private var _rows:int;
		private var _grid:Grid;
		private var _imageURL:String;
		private var _dataURL:String;
		private var _mission:MoMission;
		
		public function MoRegion()
		{
			super();
		}
		
		public function get grid():Grid {return _grid;}
		
		public function get imageURL():String { return _imageURL; }
		public function get dataURL():String { return _dataURL; }
		
		public function get cols():int { return _cols; }
		public function set cols(value:int):void
		{
			_cols = cols;
		}
		
		public function get rows():int { return _rows; }
		public function set rows(value:int):void
		{
			_rows = value;
		}
		
		override public function toString():String
		{
			return className
					+ "\n\tid: " + id
					+ "\n\tname: " + name
					+ "\n\tdescription: " + description
					+ "\n\tcols: " + _cols
					+ "\n\trows: " + _rows
					+ "\n\timage: " + _imageURL;
		}
		
		public function deserialize(json:String):void
		{
			var data:Object = JSON.parse(json);
			_cols = data.cols;
			_rows = data.rows;
			_imageURL = data.image;
			_grid = new Grid(data.cols, data.rows);
			
			RegionJsonParser.parseMapArray(this, data.map);
			trace(_grid);
		}
		
		public function serialize():String
		{
			return "";
		}
		
		public function parse(params:Object):void
		{
			id = params.id || id;
			name = params.name;
			description = params.description;
			_dataURL = params.path;
			
		}
	}
}
