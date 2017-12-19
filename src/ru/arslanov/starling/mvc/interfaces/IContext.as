/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.arslanov.starling.mvc.interfaces
{
	import flash.events.IEventDispatcher;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * Интерфейс контекста
	 * @author Artem Arslanov
	 */
	public interface IContext extends IEventDispatcher, IInstanceGetter
	{
		function get contextView():DisplayObjectContainer;
		function get mapper():IMapper;
		function get mediatorMap():IMediatorMap;
		
		function extend(extensionClass:Class):IContext;
		function configurate(configClass:Class):IContext;
	}
}
