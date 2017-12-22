package ru.arslanov.starling.mvc.interfaces
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ICommand
	{
		function execute():void;
		function destruct():void;
		function getEvent():Event;
		function get injector():IInjector;
		function get mediatorMap():IMediatorMap;
		function get commandMap():ICommandMap
		function dispatchEvent(event:Event):Boolean
	}
	
}