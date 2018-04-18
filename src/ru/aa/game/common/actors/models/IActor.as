/**
 * Created by Artem-Home on 20.02.2017.
 */
package ru.aa.game.common.actors.models
{
	import ru.aa.game.common.items.services.ItemsCollection;
	import ru.aa.game.common.utils.Position;
	import ru.aa.game.core.data.IEntityDispatcher;
	
	public interface IActor extends IEntityDispatcher
	{
		function get health():Number;
		function set health(value:Number):void;
		
		function get armor():Number;
		function set armor(value:Number):void;
		
		function get backpack():ItemsCollection;
		function get position():Position;
	}
}
