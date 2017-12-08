package ru.aa.game.models.items.actions
{
	import ru.arslanov.core.enum.EnumString;
	
	/**
	 * Идентификаторы действий предмета
	 */
	public class EnumActionProperty extends EnumString
	{
		public static const HEALTH:EnumActionProperty = new EnumActionProperty("health");
		public static const DAMAGE:EnumActionProperty = new EnumActionProperty("damage");
		public static const ARMOR:EnumActionProperty = new EnumActionProperty("armor");
		
		public function EnumActionProperty(val:String)
		{
			super(val);
		}
	}
}
