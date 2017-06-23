/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.aa.game.core.serialize
{
	public interface ISerializable
	{
		function deserialize(json:String):void;
		function serialize():String;
	}
}
