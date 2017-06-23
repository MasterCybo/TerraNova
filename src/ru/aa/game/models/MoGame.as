/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models
{
	import ru.aa.game.core.data.MoEntityDispatcher;
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.models.world.MoArea;
	
	public class MoGame extends MoEntityDispatcher
	{
		private var _currentArea:MoArea;
		private var _currentRegion:IRegion;
		
		public function MoGame()
		{
			super();
		}
		
		public function get currentArea():MoArea { return _currentArea; }
		public function set currentArea(value:MoArea):void
		{
			_currentArea = value;
		}
		
		public function get currentRegion():IRegion { return _currentRegion; }
		public function set currentRegion(value:IRegion):void
		{
			_currentRegion = value;
		}
	}
}
