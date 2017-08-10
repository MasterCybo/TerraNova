package ru.aa.game.models.region.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class CellRegionState extends EnumInt
	{
		public static const LOCKED:CellRegionState = new CellRegionState(0); // Заблокированна
		public static const CLOSED:CellRegionState = new CellRegionState(1); // Закрыта
		public static const OPENED:CellRegionState = new CellRegionState(2); // Открыта
		
		public function CellRegionState(val:int = undefined)
		{
			super(val);
		}
	}
}
