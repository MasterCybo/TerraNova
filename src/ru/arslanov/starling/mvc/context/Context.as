/**
 * Copyright (c) 2015 Artem Arslanov. All rights reserved.
 */
package ru.arslanov.starling.mvc.context
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.describeType;
	
	import ru.arslanov.starling.mvc.commands.CommandMap;
	import ru.arslanov.starling.mvc.injection.Injector;
	import ru.arslanov.starling.mvc.interfaces.ICommandMap;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.interfaces.IInjector;
	import ru.arslanov.starling.mvc.interfaces.IMediatorMap;
	import ru.arslanov.starling.mvc.interfaces.IMediatorMapExtension;
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
		
		private var _contextView:DisplayObjectContainer;
		
		public function Context(contextView:DisplayObjectContainer)
		{
			_contextView = contextView;
			_instanceMap = new Injector();
			_mediatorMap = new MediatorMap(this);
			_commandMap = new CommandMap(this);
		}
		
		public function get contextView():DisplayObjectContainer { return _contextView; }
		public function get injector():IInjector { return _instanceMap; }
		public function get mediatorMap():IMediatorMap { return _mediatorMap; }
		public function get commandMap():ICommandMap {return _commandMap;}
		
		public function install(...extensionClasses):IContext
		{
			var extClass:Class;
			for (var i:int = 0; i < extensionClasses.length; i++) {
				extClass = extensionClasses[i];
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
		
		public function configure(...configClasses):IContext
		{
			var config:Object;
			var ConfClass:Class;
			for (var i:int = 0; i < configClasses.length; i++) {
				ConfClass = configClasses[ i ];
				if (ConfClass) {
					config = new ConfClass(this);
					if (config["initialize"] != null) config.initialize();
				}
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