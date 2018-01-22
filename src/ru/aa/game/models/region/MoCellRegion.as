/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.actors.MoActor;
	import ru.aa.game.models.items.MoItem;
	import ru.aa.game.models.region.enum.CellRegionState;
	
	/**
	 * Ячейка игровой локации
	 */
	public class MoCellRegion extends ModelBase
	{
		private var _state:CellRegionState = CellRegionState.LOCKED;
		
		private var _region:MoRegion;
		private var _col:int = -1;
		private var _row:int = -1;
		
		private var _trap:Object;
		private var _item:MoItem;
		private var _character:MoActor;
		
		public function MoCellRegion(state:CellRegionState = null)
		{
			super();
			_state = state ? state : CellRegionState.LOCKED;
		}
		
		override public function destruct():void
		{
			super.destruct();
			_state = null;
			_region = null;
		}
		
		public function get region():MoRegion {return _region;}
		public function get col():int {return _col;}
		public function get row():int {return _row;}
		
		public function get locked():Boolean {return _state == CellRegionState.LOCKED;}
		
		public function get opened():Boolean {return _state == CellRegionState.OPENED;}
		public function set opened(value:Boolean):void
		{
			_state = value ? CellRegionState.OPENED : CellRegionState.CLOSED;
		}
		
		public function get state():CellRegionState {return _state;}
		public function set state(value:CellRegionState):void {_state = value;}
		
		public function get trap():Object {return _trap;}
		public function set trap(value:Object):void {_trap = value;}
		
		public function get item():MoItem {return _item;}
		public function set item(value:MoItem):void {_item = value;}
		
		public function get character():MoActor {return _character;}
		public function set character(value:MoActor):void {_character = value;}
		
		public function addToRegion(region:MoRegion, col:int, row:int):void
		{
			_region = region;
			_col = col;
			_row = row;
			_region.grid.addCellAt(col, row, this);
		}
		
		public function available():Boolean
		{
			var neighboring:MoCellRegion = _region.grid.getCellAt(_col, _row-1) as MoCellRegion;
			var leftOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getCellAt(_col, _row+1) as MoCellRegion;
			var rightOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getCellAt(_col+1, _row) as MoCellRegion;
			var bottomOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getCellAt(_col-1, _row) as MoCellRegion;
			var topOpened:Boolean = neighboring ? neighboring.opened : false;
			
			return (leftOpened || rightOpened || bottomOpened || topOpened) && !locked;
		}
	}
}
