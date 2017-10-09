package ru.aa.game.models.items
{
	import ru.arslanov.core.enum.EnumInt;
	
	public class EnumItemType extends EnumInt
	{
		public static const EQUIPMENT:EnumItemType = new EnumItemType(1); // Предмет, который можно разместить в слоте персонажа
		public static const PRODUCT:EnumItemType = new EnumItemType(2); // Предмет одноразового действия
		public static const BOX:EnumItemType = new EnumItemType(3); // Контейнер с предметами
		
		public function EnumItemType(val:int)
		{
			super(val);
		}
	}
}
