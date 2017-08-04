package ru.aa.game.models.region.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class RegionState extends EnumInt
	{
		public static const LOCKED:RegionState = new RegionState(-1); // Заблокированно
		public static const CLOSED:RegionState = new RegionState(0);
		public static const OPENED:RegionState = new RegionState(1);
		
		public function RegionState(val:int = undefined)
		{
			super(val);
		}
	}
}
