package ru.aa.game.models.collections
{
	import flash.utils.Dictionary;
	
	import ru.aa.game.models.items.EnumGroupItems;
	import ru.aa.game.models.items.MoItem;
	import ru.aa.game.models.items.MoItemKind;
	
	public class ItemsKindManager
	{
		private var _groups:Dictionary = new Dictionary();// словарь групп id = Vector
		private var _map:Object = {};// словарь предметов group_id
		
		public function ItemsKindManager()
		{
			super();
		}
		
		public function hasItem(item:MoItemKind):Boolean
		{
			return _map[item.hashKey] != undefined;
		}
		
		public function addItem(item:MoItemKind):Boolean
		{
			if (hasItem(item)) return false;
			_map[item.hashKey] = item;
		}
		
		public function removeItem(item:MoItemKind):Boolean
		{
			if (!hasItem(item)) return false;
			delete _map[item.hashKey];
		}
		
		public function removeAll():void
		{
		
		}
		
		public function addItems(group:EnumGroupItems, items:Vector.<MoItemKind>):void
		{
		
		}
		
		public function getGroupItems(group:EnumGroupItems):Vector.<MoItemKind>
		{
		
		}
	}
}
