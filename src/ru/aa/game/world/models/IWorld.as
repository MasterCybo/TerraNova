/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.world.models
{
	import ru.aa.game.core.data.IEntity;
	import ru.aa.game.core.serialize.ISerializable;
	import ru.aa.game.location.models.ILocation;
	
	public interface IWorld extends IEntity, ISerializable
	{
		function get imageURL():String;
		function get dataURL():String;
		
		function get cols():int;
		function get rows():int;
		
		function getRegionAt(col:int, row:int):ILocation;
		function getRegion(id:String):ILocation;
	}
}
