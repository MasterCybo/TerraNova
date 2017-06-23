/**
 * Created by Artem on 02.04.2016.
 */
package ru.aa.game.player.models
{
	import ru.aa.game.core.serialize.ISerializable;
	import ru.aa.game.models.actors.MoActor;
	import ru.aa.game.player.events.PlayerEvent;
	
	public class MoPlayer extends MoActor implements IPlayer, ISerializable
	{
		private var _hunger:Number = 0; // голод
		private var _thirst:Number = 0; // жажда
		private var _energy:Number = 100; // бодрость

		public function MoPlayer()
		{
			super();
			name = "Шустрый";
		}
		
		public function get hunger():Number { return _hunger; }
		public function set hunger(value:Number):void
		{
			if (value == _hunger) return;
			_hunger = value;
			dispatchEvent(new PlayerEvent(PlayerEvent.CHANGED_HUNGER));
		}
		
		public function get thirst():Number { return _thirst; }
		public function set thirst(value:Number):void
		{
			if (value == _thirst) return;
			_thirst = value;
			dispatchEvent(new PlayerEvent(PlayerEvent.CHANGED_THIRST));
		}
		
		public function get energy():Number { return _energy; }
		public function set energy(value:Number):void
		{
			if (value == _energy) return;
			_energy = value;
			dispatchEvent(new PlayerEvent(PlayerEvent.CHANGED_ENERGY));
		}
		
		/*
			Serialization
		 */
		public function deserialize(json:String):void
		{
			var data:Object = JSON.parse(json);
			name = data.userName || name;
			id = data.userID || id;
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
					;
		}
	}
}
