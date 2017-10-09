/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.core.data.MoEntity;
	import ru.aa.game.models.items.actions.ItemAction;
	
	public class MoItem extends MoEntity
	{
		private var _type:EnumItemType;
		private var _price:int;
		private var _weight:int;
		private var _image:String;
		
		private var _actions:Vector.<ItemAction> = new Vector.<ItemAction>();
		
		public function MoItem(type:EnumItemType, image:String)
		{
			super();
			_type = type;
			_image = image;
		}
		
		public function get type():EnumItemType {return _type;}
		
		public function get image():String {return _image;}
		
		public function get price():int {return _price;}
		public function set price(value:int):void {_price = value;}
		
		public function get weight():int {return _weight;}
		public function set weight(value:int):void {_weight = value;}
	}
}
