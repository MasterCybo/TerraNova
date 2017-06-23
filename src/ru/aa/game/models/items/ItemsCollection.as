/**
 * Created by Artem-Home on 21.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.models.actors.*;
	import ru.aa.game.models.*;
	import flash.utils.Dictionary;
	
	import ru.aa.game.core.data.MoEntityDispatcher;
	import ru.aa.game.models.items.IItemsCollection;
	
	public class ItemsCollection extends MoEntityDispatcher implements IItemsCollection
	{
		private var _items:Vector.<MoItem> = new Vector.<MoItem>();
		private var _map:Dictionary = new Dictionary(); // id = moItem
		
		public function ItemsCollection()
		{
			super();
		}
		
		public function get numItems():int { return _items.length; }
		
		public function hasItem(item:MoItem):Boolean { return _map[item.id] != undefined; }
		
		public function getItem(id:String):MoItem { return _map[id]; }
		
		public function addItem(item:MoItem):void
		{
			if (hasItem(item)) return;
			
			_map[item.id] = item;
			_items.push(item);
		}
		
		public function removeItem(item:MoItem):void
		{
			if (!hasItem(item)) return;
			
			var idx:int = _items.indexOf(item);
			if (idx != -1) {
				_items.splice(idx, 1);
				delete _map[item.id];
			}
		}
	}
}
