package ru.aa.game.models.items.actions
{
	public class ItemAction
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
