/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.region.enum.RegionType;
	
	public class MoRegionCell extends ModelBase
	{
		private var _type:RegionType = RegionType.EMPTY;
		private var _opened:Boolean;
		private var _locked:Boolean;
		
		public function MoRegionCell(type:RegionType)
		{
			super();
			_type = type;
		}
		
		public function get type():RegionType {return _type;}
		
		public function get opened():Boolean {return _opened;}
		public function set opened(value:Boolean):void
		{
			_opened = value;
		}
		
		public function get locked():Boolean {return _locked;}
		public function set locked(value:Boolean):void
		{
			_locked = value;
		}
	}
}
