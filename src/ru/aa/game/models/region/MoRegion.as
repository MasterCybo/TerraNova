/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.MoEntityDispatcher;
	
	public class MoRegion extends MoEntityDispatcher implements IRegion
	{
		private var _cols:int;
		private var _rows:int;
		private var _imageURL:String;
		
		public function MoRegion()
		{
			super();
		}
		
		public function get imageURL():String { return _imageURL; }
		
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
		}
		
		public function serialize():String
		{
			return "";
		}
	}
}
