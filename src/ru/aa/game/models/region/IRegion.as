/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.models.region
{
	import ru.aa.game.core.data.IEntityDispatcher;
	import ru.aa.game.core.serialize.ISerializable;
	
	public interface IRegion extends IEntityDispatcher, ISerializable
	{
		function get cols():int;
		function set cols(value:int):void;
		
		function get rows():int;
		function set rows(value:int):void;
		
		function get imageURL():String;
	}
}
