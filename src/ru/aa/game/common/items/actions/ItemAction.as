package ru.aa.game.common.items.actions
{
	import ru.aa.game.common.items.IItemContent;
	import ru.aa.game.core.serialize.IParsable;
	import ru.arslanov.core.enum.Enum;
	
	public class ItemAction implements IItemContent, IParsable
	{
		private var _property:EnumActionProperty;
		private var _value:Number = 0;
		
		public function ItemAction(property:EnumActionProperty = null, value:Number = 0)
		{
			_property = property;
			_value = value
		}
		
		public function get property():EnumActionProperty {return _property;}
		public function get value():Number {return _value;}
		
		public function parse(data:Object):void
		{
			_property = Enum.getElementByValue(data["property"], EnumActionProperty) as EnumActionProperty;
			_value = data["value"];
		}
	}
}
