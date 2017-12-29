/**
 * Copyright (c) 2015 Artem Arslanov. All rights reserved.
 */
package ru.arslanov.starling.mvc.context
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.describeType;
	
	import ru.arslanov.starling.mvc.commands.CommandMap;
	import ru.arslanov.starling.mvc.config.ConfigsManager;
	import ru.arslanov.starling.mvc.extensions.ExtensionInstaller;
	import ru.arslanov.starling.mvc.injection.Injector;
	import ru.arslanov.starling.mvc.commands.ICommandMap;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.injection.IInjector;
	import ru.arslanov.starling.mvc.mediators.IMediatorMap;
	import ru.arslanov.starling.mvc.mediators.IMediatorMapExtension;
	import ru.arslanov.starling.mvc.mediators.MediatorMap;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * Контекст - основной класс архитектуры, который содержит менеджеры основных сущностей фреймворка.
	 * В то же время, является центральной шиной событий для связи между модулями приложения.
	 * @author Artem Arslanov
	 */
	public class Context extends EventDispatcher implements IContext
	{
		private var _instanceMap:IInjector;
		private var _commandMap:ICommandMap;
		private var _mediatorMap:IMediatorMap;
		
		private var _extensionInstaller:ExtensionInstaller;
		private var _configsManager:ConfigsManager;
		
		private var _contextView:DisplayObjectContainer;
		
		public function Context(contextView:DisplayObjectContainer)
		{
			_contextView = contextView;
			_instanceMap = new Injector();
			_mediatorMap = new MediatorMap(this);
			_commandMap = new CommandMap(this);
			_extensionInstaller = new ExtensionInstaller(this);
			_configsManager = new ConfigsManager(this);
		}
		
		public function get contextView():DisplayObjectContainer { return _contextView; }
		public function get injector():IInjector { return _instanceMap; }
		public function get mediatorMap():IMediatorMap { return _mediatorMap; }
		public function get commandMap():ICommandMap {return _commandMap;}
		
		public function install(...extensions):IContext
		{
			var extClass:Class;
			for (var i:int = 0; i < extensions.length; i++) {
				_extensionInstaller.install(extensions[i]);
				extClass = extensions[i];
				switch (true) {
					case isImplementsOf(extClass, IMediatorMapExtension):
						_mediatorMap.addExtension(extClass);
						break;
//				case isImplementsOf(extClass, ICommandMapExtension):
//					break;
				}
			}
			
			return this;
		}
		
		public function configure(...configs):IContext
		{
			for (var i:int = 0; i < configs.length; i++) {
				_configsManager.configure(configs[i]);
			}
			return this;
		}
		
		/*
		 *	Events
		 */
		override public function dispatchEvent(event:Event):Boolean
		{
			_commandMap.dispatchEvent(event);
			return super.dispatchEvent(event);
		}
		
		/**
		 * Утилитная внутренняя функция проверки цепочки наследования класса
		 * @param implementor
		 * @param prototype
		 * @return
		 */
		private function isImplementsOf(implementor:Class, prototype:Class):Boolean
		{
			var xml:XML = describeType(implementor);
			var xmlImplements:XMLList = xml..implementsInterface;
			var proto:String = prototype.toString();
			proto = proto.substring(7, proto.length - 1);
			
			var item:XML;
			var itemType:String;
			var idx:int;
			for each (item in xmlImplements) {
				itemType = item.@type.toString();
				idx = itemType.indexOf(proto);
				if (idx != -1) return true;
			}
			return false;
		}
	}
}