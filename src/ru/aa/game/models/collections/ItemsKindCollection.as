package ru.aa.game.models.collections
{
	import flash.utils.Dictionary;
	
	import ru.aa.game.core.serialize.ISerializable;
	
	import ru.aa.game.models.items.EnumGroupItems;
	import ru.aa.game.models.items.MoItem;
	import ru.aa.game.models.items.MoItemKind;
	import ru.aa.game.models.items.MoItemsContainer;
	
	/**
	 * Коллекция прототипов предметов
	 */
	public class ItemsKindCollection implements ISerializable
	{
		private var _groups:Dictionary = new Dictionary();// словарь групп group = Vector.<MoItemKind>
		private var _map:Object = {};// словарь предметов group_id
		
		public function ItemsKindCollection()
		{
			super();
		}
		
		public function hasItemKind(kind:MoItemKind):Boolean
		{
			return _map[kind.hashKey] != undefined;
		}
		
		public function addItemKind(kind:MoItemKind):Boolean
		{
			if (hasItemKind(kind)) return false;
			
			_map[kind.hashKey] = kind;
			
			var group:Vector.<MoItemKind> = getGroupItemsKind(kind.group);
			if (group == null) {
				group = new Vector.<MoItemKind>();
				_groups[kind.group] = group;
			}
			group.push(kind);
			return true;
		}
		
		public function removeItemKind(kind:MoItemKind):Boolean
		{
			if (!hasItemKind(kind)) return false;
			
			delete _map[kind.hashKey];
			
			var group:Vector.<MoItemKind> = getGroupItemsKind(kind.group);
			var idx:int = group.indexOf(kind);
			if (idx == -1) return false;
			group.splice(idx, 1);
			return true;
		}
		
		public function removeAll():void
		{
			_groups = new Dictionary();
			_map = {};
		}
		
		public function addItemsKind(kinds:Vector.<MoItemKind>):void
		{
			for (var i:int = 0; i < kinds.length; i++) {
				addItemKind(kinds[i]);
			}
		}
		
		public function getGroupItemsKind(group:EnumGroupItems):Vector.<MoItemKind>
		{
			return _groups[group];
		}
		
		private function hasGroup(group:EnumGroupItems):Boolean
		{
			return _groups[group] != null;
		}
		
		public function deserialize(json:String):void
		{
			var data:Object = JSON.parse(json);
			
			const groups:Array = [EnumGroupItems.EQUIPMENT, EnumGroupItems.PRODUCT, EnumGroupItems.BOX];
			
			var group:EnumGroupItems;
			var kinds:Array;
			var kindData:Object;
			var kind:MoItemKind;
			for (var i:int = 0; i < groups.length; i++) {
				group = groups[i];
				kinds = data[group];
				if (kinds) {
					for (var j:int = 0; j < kinds.length; j++) {
						kindData = kinds[j];
						kind = new MoItemKind();
						kind.parse(kindData);
						addItemKind(kind);
					}
				}
			}
		}
		
		public function serialize():String
		{
			return "";
		}
	}
}
