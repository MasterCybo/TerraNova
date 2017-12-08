package ru.aa.game.models.items.actions
{
	import ru.aa.game.models.items.IItemContent;
	
	public class ItemAction implements IItemContent
	{
		private var _property:EnumActionProperty;
		private var _value:Number;
		
		public function ItemAction(property:EnumActionProperty, value:Number)
		{
			_property = property;
			_value = value
		}
		
		public function get property():EnumActionProperty {return _property;}
		public function get value():Number {return _value;}
	}
}
