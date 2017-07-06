/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models
{
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.models.world.IWorld;
	
	public class Position
	{
		private var _world:IWorld;
		private var _region:IRegion;
		private var _col:int = -1;
		private var _row:int = -1;
		
		public function Position()
		{
		}
		
		
		public function get world():IWorld { return _world; }
		public function set world(value:IWorld):void { _world = value; }
		
		public function get region():IRegion { return _region; }
		public function set region(value:IRegion):void { _region = value; }
		
		public function get col():int { return _col; }
		public function set col(value:int):void { _col = value; }
		
		public function get row():int { return _row; }
		public function set row(value:int):void { _row = value; }
		
		public function clearRegion():void
		{
			_region = null;
			_col = -1;
			_row = -1;
		}
		
		public function toString():String
		{
			return this + "\n"
					+ _world + "\n"
					+ _region + "\n"
					+ _col + "\n"
					+ _row
					;
		}
	}
}
