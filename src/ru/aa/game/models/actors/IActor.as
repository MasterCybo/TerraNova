/**
 * Created by Artem-Home on 20.02.2017.
 */
package ru.aa.game.models.actors
{
	import ru.aa.game.models.*;
	import ru.aa.game.core.data.IEntityDispatcher;
	import ru.aa.game.models.items.IBackpack;
	
	public interface IActor extends IEntityDispatcher
	{
		function get health():Number;
		function set health(value:Number):void;
		
		function get armor():Number;
		function set armor(value:Number):void;
		
		function get backpack():IBackpack;
	}
}
