package ru.aa.game.models.region.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class CellRegionType extends EnumInt
	{
		public static const EMPTY:CellRegionType = new CellRegionType(0); // Пусто, дыра, ничто - никаких действий выполнить нельзя
		public static const FLORA:CellRegionType = new CellRegionType(10); // Лес, кусты, дерево
		public static const WATER:CellRegionType = new CellRegionType(20); // Вода, реки, озёра
		public static const GRASS:CellRegionType = new CellRegionType(30); // Трава, лужайка, поле
		public static const SAND:CellRegionType = new CellRegionType(40); // Песок
		public static const STONE:CellRegionType = new CellRegionType(50); // Камни, горы, скалы
		public static const GROUND:CellRegionType = new CellRegionType(60); // Земля
		public static const BUILDING:CellRegionType = new CellRegionType(70); // Строение, дом, сайрай
		public static const GARBAGE:CellRegionType = new CellRegionType(80); // Мусор, свалка, отходы
		
		public function CellRegionType(val:int = undefined)
		{
			super(val);
		}
	}
}
