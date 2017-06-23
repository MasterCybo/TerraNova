/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.models.actors.*;
	import ru.aa.game.models.*;
	public class MoBackpack extends ItemsCollection implements IBackpack
	{
		private var _capacity:int;
		
		public function MoBackpack()
		{
			super();
		}
		
		public function get capacity():int { return _capacity; }
	}
}
