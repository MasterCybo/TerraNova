/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.core.data
{
	public class MoEntity extends ModelBase implements IEntity
	{
		protected var _name:String = "";
		protected var _description:String = "";
		
		/**
		 * Сущность - модель c именем и описанием
		 */
		public function MoEntity()
		{
			super();
		}
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }
		
		public function get description():String { return _description; }
		public function set description(value:String):void { _description = value; }
	}
}
