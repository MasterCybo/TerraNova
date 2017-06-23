/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.models.world
{
	import ru.aa.game.core.data.IEntity;
	import ru.aa.game.core.serialize.ISerializable;
	
	public interface IWorld extends IEntity, ISerializable
	{
		function get imageURL():String;
		
		function get cols():int;
		function get rows():int;
		
		function getAreaAt(col:int, row:int):MoArea;
		function getArea(id:String):MoArea;
	}
}
