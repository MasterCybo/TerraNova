package ru.aa.game.models.items
{
	import ru.aa.game.core.data.MoEntity;
	import ru.aa.game.core.serialize.IParsable;
	import ru.aa.game.models.items.actions.ItemAction;
	
	/**
	 * Базовая сущность/прототип предмета
	 */
	public class MoItemKind extends MoEntity implements IParsable
	{
		private var _group:EnumGroupItems;
		private var _price:int;
		private var _weight:int;
		private var _image:String;
		
		private var _actions:Vector.<IItemContent> = new Vector.<IItemContent>();
		
		public function MoItemKind(group:EnumGroupItems = null, id:String = null, image:String = null)
		{
			super();
			__id = id;
			_group = group;
			_image = image;
		}
		
		public function get hashKey():String {return _group.value + "_" + __id;}
		
		public function get group():EnumGroupItems {return _group;}
		
		public function get image():String {return _image;}
		
		public function get price():int {return _price;}
		public function set price(value:int):void {_price = value;}
		
		public function get weight():int {return _weight;}
		public function set weight(value:int):void {_weight = value;}
		
		public function get actions():Vector.<IItemContent> {return _actions;}
		
		public function parse(data:Object):void
		{
			__id = data["id"];
			_image = data["image"];
			_name = data["name"];
			_description = data["description"];
			_weight = data["weight"];
			_price = data["price"];
			
			if (!_group.equals(EnumGroupItems.BOX)) {
				var actionsData:Array = data["content"];
				var contentData:Object;
				var action:ItemAction;
				var len:int = actionsData.length;
				for (var i:int = 0; i < len; i++) {
					contentData = actionsData[i];
					action = new ItemAction();
					action.parse(contentData);
					_actions.push(action);
				}
			}
		}
	}
}