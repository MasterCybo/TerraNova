/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models
{
	import ru.aa.game.models.region.IRegion;
	import ru.aa.game.models.world.IWorld;
	
	public class Position
	{
		public var world:IWorld;
		public var region:IRegion;
		public var col:int = -1;
		public var row:int = -1;
		
		public function Position()
		{
		}
	}
}
