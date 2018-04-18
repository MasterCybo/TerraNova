/**
 * Created by Artem-Home on 21.02.2017.
 */
package ru.aa.game.common.items.services
{
	import flash.utils.Dictionary;
	
	import ru.aa.game.common.items.models.MoItem;
	import ru.aa.game.core.data.MoEntityDispatcher;
	
	/**
	 * Коллекция предметов
	 */
	public class ItemsCollection extends MoEntityDispatcher implements IItemsCollection
	{
		private var _items:Vector.<MoItem> = new Vector.<MoItem>();
		private var _map:Dictionary = new Dictionary(); // id = moItem
		private var _maxItems:int = -1;
		
		public function ItemsCollection()
		{
			super();
		}
		
		public function get numItems():int { return _items.length; }
		
		public function get maxItems():int { return _maxItems; }
		public function set maxItems(value:int):void { _maxItems = value; }
		
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
		
		public function sort():void
		{
			// TODO: sort
		}
		
		public function filter():void
		{
			// TODO: filter
		}
	}
}
