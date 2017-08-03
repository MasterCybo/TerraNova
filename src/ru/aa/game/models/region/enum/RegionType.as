package ru.aa.game.models.region.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class RegionType extends EnumInt
	{
		public static const EMPTY:RegionType = new RegionType(-1);
		public static const FOREST:RegionType = new RegionType(10);
		public static const WATER:RegionType = new RegionType(20);
		public static const GRASS:RegionType = new RegionType(30);
		public static const SAND:RegionType = new RegionType(40);
		public static const STONE:RegionType = new RegionType(50);
		public static const GROUND:RegionType = new RegionType(60);
		
		public function RegionType(val:int = NaN)
		{
			super(val);
		}
	}
}
