package ru.aa.game.models.items
{
	import ru.arslanov.core.enum.EnumInt;
	
	/**
	 * Идентификаторы групп предметов
	 */
	public class EnumGroupItems extends EnumInt
	{
		public static const EQUIPMENT:EnumGroupItems = new EnumGroupItems(1); // Предмет, который можно разместить в слоте персонажа
		public static const PRODUCT:EnumGroupItems = new EnumGroupItems(2); // Предмет одноразового действия
		public static const BOX:EnumGroupItems = new EnumGroupItems(3); // Контейнер с предметами
		
		public function EnumGroupItems(val:int)
		{
			super(val);
		}
	}
}
