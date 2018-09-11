/**
 * Created by Artem on 02.04.2016.
 */
package ru.aa.game.hero.models
{
	import ru.aa.game.common.actors.events.ActorEvent;
	import ru.aa.game.common.actors.models.MoActor;
	import ru.aa.game.core.serialize.ISerializable;
	
	/**
	 * Модель главного героя
	 */
	public class MoHero extends MoActor implements ISerializable
	{
		private var _hunger:Number = 0; // голод
		private var _thirst:Number = 0; // жажда
		private var _energy:Number = 100; // бодрость

		public function MoHero()
		{
			super();
			name = "Шустрый";
		}
		
		public function get hunger():Number { return _hunger; }
		public function set hunger(value:Number):void
		{
			if (value == _hunger) return;
			_hunger = value;
			dispatchEvent(new ActorEvent(ActorEvent.CHANGED_HUNGER));
		}
		
		public function get thirst():Number { return _thirst; }
		public function set thirst(value:Number):void
		{
			if (value == _thirst) return;
			_thirst = value;
			dispatchEvent(new ActorEvent(ActorEvent.CHANGED_THIRST));
		}
		
		public function get energy():Number { return _energy; }
		public function set energy(value:Number):void
		{
			if (value == _energy) return;
			_energy = value;
			dispatchEvent(new ActorEvent(ActorEvent.CHANGED_ENERGY));
		}
		
		/*
			Serialization
		 */
		public function deserialize(json:String):void
		{
			var data:Object = JSON.parse(json);
			name = data.userName || name;
			__id = data.userID || id;
		}
		
		public function serialize():String
		{
			var result:String = JSON.stringify({
				userName: name,
				userID: id
			});
			return result;
		}
		
		override public function toString():String
		{
			return className
					+ "\n\tID: " + id
					+ "\n\tname: " + name
					+ "\n\thealth: " + health
					+ "\n\tposition: " + position
					;
		}
	}
}
