/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.data
{
	public class ModelBase implements IModel
	{
		static private var _count:uint = 0;
		
		protected var __id:String;
		
		/**
		 * Базовая модель с уникальным идентификатором
		 */
		public function ModelBase()
		{
			__id = "" + (++_count);
			super();
		}
		
		public function destruct():void {
			// override me
		}
		
		public function get id():String { return __id; }
		
		public function get className():Class { return this["constructor"]; }
		
		public function toString():String
		{
			return "[object ModelBase]";
		}
	}
}
