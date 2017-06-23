/**
 * Created by Artem-Home on 18.02.2017.
 */
package ru.aa.game.core.data
{
	public interface IEntity extends IModel
	{
		function get name():String;
		function set name(value:String):void;
		
		function get description():String;
		function set description(value:String):void;
	}
}
