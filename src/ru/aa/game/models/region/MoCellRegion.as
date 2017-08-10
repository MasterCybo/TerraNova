/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.region.enum.CellRegionState;
	import ru.aa.game.models.region.enum.CellRegionType;
	
	public class MoCellRegion extends ModelBase
	{
		private var _type:CellRegionType = CellRegionType.EMPTY;
		private var _state:CellRegionState = CellRegionState.LOCKED;
		
		public function MoCellRegion(type:CellRegionType, state:CellRegionState = null)
		{
			super();
			_type = type;
			_state = state ? state : CellRegionState.LOCKED;
		}
		
		public function get type():CellRegionType {return _type;}
		
		public function get state():CellRegionState {return _state;}
		public function set state(value:CellRegionState):void
		{
			_state = value;
		}
	}
}
