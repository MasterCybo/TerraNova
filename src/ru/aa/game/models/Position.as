/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.models
{
	import ru.aa.game.models.region.MoRegion;
	import ru.aa.game.models.world.MoWorld;
	
	public class Position
	{
		public var world:MoWorld;
		public var region:MoRegion;
		public var col:int = -1;
		public var row:int = -1;
		
		public function Position()
		{
		}
	}
}
