/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.location.models
{
	import ru.aa.game.common.actors.models.MoActor;
	import ru.aa.game.common.items.models.MoItem;
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.location.enum.CellLocationState;
	
	/**
	 * Ячейка игровой локации
	 */
	public class MoCellLocation extends ModelBase
	{
		private var _state:CellLocationState = CellLocationState.LOCKED;
		
		private var _region:MoLocation;
		private var _col:int = -1;
		private var _row:int = -1;
		
		private var _trap:Object;
		private var _item:MoItem;
		private var _character:MoActor;
		
		public function MoCellLocation(state:CellLocationState = null)
		{
			super();
			_state = state ? state : CellLocationState.LOCKED;
		}
		
		override public function destruct():void
		{
			super.destruct();
			_state = null;
			_region = null;
		}
		
		public function get region():MoLocation {return _region;}
		public function get col():int {return _col;}
		public function get row():int {return _row;}
		
		public function get locked():Boolean {return _state == CellLocationState.LOCKED;}
		
		public function get opened():Boolean {return _state == CellLocationState.OPENED;}
		public function set opened(value:Boolean):void
		{
			_state = value ? CellLocationState.OPENED : CellLocationState.CLOSED;
		}
		
		public function get state():CellLocationState {return _state;}
		public function set state(value:CellLocationState):void {_state = value;}
		
		public function get trap():Object {return _trap;}
		public function set trap(value:Object):void {_trap = value;}
		
		public function get item():MoItem {return _item;}
		public function set item(value:MoItem):void {_item = value;}
		
		public function get character():MoActor {return _character;}
		public function set character(value:MoActor):void {_character = value;}
		
		public function addToRegion(region:MoLocation, col:int, row:int):void
		{
			_region = region;
			_col = col;
			_row = row;
			_region.grid.addAt(col, row, this);
		}
		
		public function available():Boolean
		{
			var neighboring:MoCellLocation = _region.grid.getAt(_col, _row-1) as MoCellLocation;
			var leftOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getAt(_col, _row+1) as MoCellLocation;
			var rightOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getAt(_col+1, _row) as MoCellLocation;
			var bottomOpened:Boolean = neighboring ? neighboring.opened : false;
			
			neighboring = _region.grid.getAt(_col-1, _row) as MoCellLocation;
			var topOpened:Boolean = neighboring ? neighboring.opened : false;
			
			return (leftOpened || rightOpened || bottomOpened || topOpened) && !locked;
		}
	}
}
