/**
 * Created by Artem-Home on 20.02.2017.
 */
package ru.aa.game.models.actors
{
	import ru.aa.game.core.data.MoEntityDispatcher;
	import ru.aa.game.models.Position;
	import ru.aa.game.models.items.ItemsCollection;
	import ru.aa.game.player.events.ActorEvent;
	
	/**
	 * Любой персонаж в игре
	 */
	public class MoActor extends MoEntityDispatcher implements IActor
	{
		private var _position:Position = new Position();
		private var _health:Number = 100;
		private var _armor:Number = 0;
		private var _backpack:ItemsCollection;
		
		public function MoActor()
		{
			super();
		}
		
		public function get backpack():ItemsCollection { return _backpack; }
		public function get position():Position { return _position; }
		
		public function get health():Number { return _health; }
		public function set health(value:Number):void
		{
			if (value == _health) return;
			_health = value;
			dispatchEvent(new ActorEvent(ActorEvent.CHANGED_HEALTH));
		}
		
		public function get armor():Number { return _armor; }
		public function set armor(value:Number):void
		{
			_armor = value;
		}
	}
}
