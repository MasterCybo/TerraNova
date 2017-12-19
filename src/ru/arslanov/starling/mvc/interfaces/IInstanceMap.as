/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.interfaces
{
	public interface IInstanceMap extends IInstanceGetter
	{
		function unmap(type:*):void;
		function map(type:*):IInstanceSetter;
		function unmapAll():void;
		function getAllTypes():Vector.<*>;
	}
}
