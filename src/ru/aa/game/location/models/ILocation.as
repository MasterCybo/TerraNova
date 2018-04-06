/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.location.models
{
	import ru.aa.game.common.collections.Grid;
	import ru.aa.game.core.data.IEntityDispatcher;
	import ru.aa.game.core.serialize.ISerializable;
	
	public interface ILocation extends IEntityDispatcher, ISerializable
	{
		function get grid():Grid;
		
		function get cols():int;
		function set cols(value:int):void;
		
		function get rows():int;
		function set rows(value:int):void;
		
		function get imageURL():String;
		function get dataURL():String;
	}
}
