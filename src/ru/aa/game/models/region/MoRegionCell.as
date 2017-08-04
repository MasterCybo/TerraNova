/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.region.enum.RegionState;
	import ru.aa.game.models.region.enum.RegionType;
	
	public class MoRegionCell extends ModelBase
	{
		private var _type:RegionType = RegionType.EMPTY;
		private var _state:RegionState = RegionState.LOCKED;
		
		public function MoRegionCell(type:RegionType, state:RegionState = null)
		{
			super();
			_type = type;
			_state = state ? state : RegionState.LOCKED;
		}
		
		public function get type():RegionType {return _type;}
		
		public function get state():RegionState {return _state;}
		public function set state(value:RegionState):void
		{
			_state = value;
		}
	}
}
