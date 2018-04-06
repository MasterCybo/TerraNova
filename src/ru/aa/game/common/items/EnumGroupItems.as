package ru.aa.game.common.items
{
	import ru.arslanov.core.enum.EnumString;
	
	/**
	 * Идентификаторы групп предметов
	 */
	public class EnumGroupItems extends EnumString
	{
		public static const EQUIPMENT:EnumGroupItems = new EnumGroupItems("equipment"); // Предмет, который можно разместить в слоте персонажа
		public static const PRODUCT:EnumGroupItems = new EnumGroupItems("product"); // Предмет одноразового действия
		public static const BOX:EnumGroupItems = new EnumGroupItems("box"); // Контейнер с предметами
		
		public function EnumGroupItems(val:String)
		{
			super(val);
		}
	}
}
