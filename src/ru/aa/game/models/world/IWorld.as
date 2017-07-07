/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.models.world
{
	import ru.aa.game.core.data.IEntity;
	import ru.aa.game.core.serialize.ISerializable;
	import ru.aa.game.models.region.IRegion;
	
	public interface IWorld extends IEntity, ISerializable
	{
		function get imageURL():String;
		function get dataURL():String;
		
		function get cols():int;
		function get rows():int;
		
		function getRegionAt(col:int, row:int):IRegion;
		function getRegion(id:String):IRegion;
	}
}
