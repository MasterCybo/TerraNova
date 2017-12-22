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
	public interface IContext extends IEventDispatcher
	{
		function get contextView():DisplayObjectContainer;
		function get injector():IInjector;
		function get mediatorMap():IMediatorMap;
		function get commandMap():ICommandMap;
		
		function install(...extensionClasses):IContext;
		function configure(...configClasses):IContext;
	}
}
