package ru.aa.game.models.items
{
	import ru.aa.game.core.data.MoEntity;
	
	/**
	 * Базовая сущность/прототип предмета
	 */
	public class MoItemKind extends MoEntity
	{
		private var _group:EnumGroupItems;
		private var _price:int;
		private var _weight:int;
		private var _image:String;
		
		private var _actions:Vector.<IItemContent> = new Vector.<IItemContent>();
		
		public function MoItemKind(group:EnumGroupItems, id:String, image:String)
		{
			super();
			__id = id;
			_group = group;
			_image = image;
		}
		
		public function get hashKey():String
		{
			return _group + "_" + __id;
		}
		
		public function get group():EnumGroupItems {return _group;}
		
		public function get image():String {return _image;}
		
		public function get price():int {return _price;}
		public function set price(value:int):void {_price = value;}
		
		public function get weight():int {return _weight;}
		public function set weight(value:int):void {_weight = value;}
		
		public function get actions():Vector.<IItemContent> {return _actions;}
	}
}
