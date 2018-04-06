package ru.aa.game.location.enum
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class CellLocationState extends EnumInt
	{
		public static const LOCKED:CellLocationState = new CellLocationState(0); // Заблокированна
		public static const CLOSED:CellLocationState = new CellLocationState(1); // Закрыта
		public static const OPENED:CellLocationState = new CellLocationState(2); // Открыта
		
		public function CellLocationState(val:int = undefined)
		{
			super(val);
		}
	}
}
