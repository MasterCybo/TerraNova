package ru.aa.game.models.region.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class RegionType extends EnumInt
	{
		public static const EMPTY:RegionType = new RegionType(-1); // Пусто - никаких действий выполнить нельзя
		public static const FLORA:RegionType = new RegionType(10); // Лес, кусты, дерево
		public static const WATER:RegionType = new RegionType(20); // Вода, реки, озёра
		public static const GRASS:RegionType = new RegionType(30); // Трава, лужайка, поле
		public static const SAND:RegionType = new RegionType(40); // Песок
		public static const STONE:RegionType = new RegionType(50); // Камни, горы, скалы
		public static const GROUND:RegionType = new RegionType(60); // Земля
		public static const BUILDING:RegionType = new RegionType(70); // Строение, дом, сайрай
		public static const GARBAGE:RegionType = new RegionType(80); // Мусор, свалка, отходы
		
		public function RegionType(val:int = undefined)
		{
			super(val);
		}
	}
}
