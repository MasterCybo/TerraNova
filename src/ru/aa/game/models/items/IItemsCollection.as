/**
 * Created by Artem-Home on 21.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.models.*;
	import ru.aa.game.core.data.IEntityDispatcher;
	
	public interface IItemsCollection extends IEntityDispatcher
	{
		function get numItems():int;
		function hasItem(item:MoItem):Boolean;
		function getItem(id:String):MoItem;
		function addItem(item:MoItem):void;
	}
}
