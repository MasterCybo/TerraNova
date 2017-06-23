/**
 * Created by Artem-Home on 20.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.models.*;
	public interface IBackpack extends IItemsCollection
	{
		function get capacity():int;
	}
}
