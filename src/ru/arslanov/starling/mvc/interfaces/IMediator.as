package ru.arslanov.starling.mvc.interfaces
{
	import starling.display.DisplayObject;
	
	/**
	 * Интерфейс медиатора
	 * @author Artem Arslanov
	 */
	public interface IMediator
	{
		function initialize(displayObject:DisplayObject):void;
		function destroy():void;
		
		function getView():DisplayObject;
	}
	
}