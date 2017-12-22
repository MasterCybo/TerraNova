/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.interfaces
{
	public interface IInjector
	{
		function hasOf(type:*):Boolean;
		function getOf(type:*):*;
		
		function unmap(type:*):void;
		function map(type:*):IInjectorSetter;
		function unmapAll():void;
		function getAllTypes():Vector.<*>;
	}
}
