/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.interfaces
{
	public interface IMapper
	{
		function map(type:*):IMapSetter;
		function unmap(type:*):void;
	}
}
