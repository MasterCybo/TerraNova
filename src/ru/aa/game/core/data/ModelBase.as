/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.data
{
	public class ModelBase implements IModel
	{
		static private var _count:uint = 0;
		
		private var _id:String;
		
		/**
		 * Базовая модель с уникальным идентификатором
		 */
		public function ModelBase()
		{
			_id = "" + (++_count);
			super();
		}
		
		public function destruct():void {
			// override me
		}
		
		public function get id():String { return _id; }
		public function set id(value:String):void { _id = value; }
		
		public function get className():Class { return this["constructor"]; }
		
		public function toString():String
		{
			return "[object ModelBase]";
		}
	}
}
