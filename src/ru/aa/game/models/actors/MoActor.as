/**
 * Created by Artem-Home on 20.02.2017.
 */
package ru.aa.game.models.actors
{
	import ru.aa.game.core.data.MoEntityDispatcher;
	import ru.aa.game.models.items.IBackpack;
	
	public class MoActor extends MoEntityDispatcher implements IActor
	{
		private var _health:Number = 100;
		private var _armor:Number = 0;
		private var _backpack:IBackpack;
		
		public function MoActor()
		{
			super();
		}
		
		public function get backpack():IBackpack { return _backpack; }
		
		public function get health():Number { return _health; }
		public function set health(value:Number):void
		{
			_health = value;
		}
		
		public function get armor():Number { return _armor; }
		public function set armor(value:Number):void
		{
			_armor = value;
		}
	}
}
