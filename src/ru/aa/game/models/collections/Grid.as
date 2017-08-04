package ru.aa.game.models.collections
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import ru.aa.game.core.data.ModelBase;
	
	public class Grid extends EventDispatcher
	{
		private var _cols:int;
		private var _rows:int;
		private var _objects:Vector.<Vector.<ModelBase>>;
		
		public function Grid(cols:uint, rows:uint)
		{
			super();
			_cols = cols;
			_rows = rows;
			
			_objects = new Vector.<Vector.<ModelBase>>(_cols);
			
			for (var i:int = 0; i < _cols; i++) {
				_objects[i] = new Vector.<ModelBase>(_rows);
			}
		}
		
		public function get cols():int {return _cols;}
		public function get rows():int {return _rows;}
		
		public function addCellAt(col:int, row:int, object:ModelBase):void
		{
			if ((col >= _cols) || (col < 0)) throw new RangeError("Column out of range " + col + " / " + _cols);
			if ((row >= _rows) || (row < 0)) throw new RangeError("Row out of range " + row + " / " + _rows);
			
			_objects[col][row] = object;
		}
		
		public function getCellAt(col:int, row:int):ModelBase
		{
			if (col >= _cols || col < 0) throw new RangeError("Column out of range " + col + " / " + _cols);
			if (row >= _rows || row < 0) throw new RangeError("Row out of range " + row + " / " + _rows);
			
			return _objects[col][row];
		}
		
		public function removeAt(col:int, row:int):void
		{
			if (col >= _cols || col < 0) throw new RangeError("Column out of range " + col + " / " + _cols);
			if (row >= _rows || row < 0) throw new RangeError("Row out of range " + row + " / " + _rows);
			
			_objects[col][row] = null;
		}
		
		public function isEmptyAt(col:int, row:int):Boolean
		{
			return _objects[col][row] == null;
		}
		
		override public function toString():String
		{
			return "[object Grid], " + _cols + "x" + _rows;
		}
	}
}
