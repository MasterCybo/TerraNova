/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.collections.Grid;
	import ru.aa.game.models.region.enum.CellRegionState;
	import ru.aa.game.models.region.enum.CellRegionType;
	
	public class MoCellRegion extends ModelBase
	{
		private var _type:CellRegionType = CellRegionType.EMPTY;
		private var _state:CellRegionState = CellRegionState.LOCKED;
		
		private var _grid:Grid;
		
		public function MoCellRegion(type:CellRegionType, state:CellRegionState = null)
		{
			super();
			_type = type;
			_state = state ? state : CellRegionState.LOCKED;
		}
		
		override public function destruct():void
		{
			super.destruct();
			_type = null;
			_state = null;
			_grid = null;
		}
		
		public function get type():CellRegionType {return _type;}
		public function get grid():Grid {return _grid;}
		
		public function get locked():Boolean {return _state == CellRegionState.LOCKED;}
		
		public function get opened():Boolean {return _state == CellRegionState.OPENED;}
		public function set opened(value:Boolean):void
		{
			_state = value ? CellRegionState.OPENED : CellRegionState.CLOSED;
		}
		
		public function get state():CellRegionState {return _state;}
		public function set state(value:CellRegionState):void {_state = value;}
		
		public function addToGrid(grid:Grid, col:int, row:int):void
		{
			_grid = grid;
			_grid.addCellAt(col, row, this);
		}
	}
}
