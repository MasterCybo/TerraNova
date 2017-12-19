/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc
{
	import ru.arslanov.starling.mvc.interfaces.ICommandMap;
	import ru.arslanov.starling.mvc.interfaces.IMapSetter;
	import ru.arslanov.starling.mvc.interfaces.IInstanceMap;
	import ru.arslanov.starling.mvc.interfaces.IMapper;
	import ru.arslanov.starling.mvc.interfaces.IMediatorMap;
	
	public class Mapper implements IMapper, IMapSetter
	{
		private var _instanceMap:IInstanceMap;
		private var _mediatorMap:IMediatorMap;
		private var _commandMap:ICommandMap;
		
		private var _mappingType:*;
		
		/**
		 * Предоставляет единый интерфейс для связывания медиаторов, событий и команд, типов и объектов
		 * @param injectionMap
		 * @param mediatorMap
		 * @param commandMap
		 */
		public function Mapper(injectionMap:IInstanceMap, mediatorMap:IMediatorMap, commandMap:ICommandMap)
		{
			_instanceMap = injectionMap;
			_mediatorMap = mediatorMap;
			_commandMap = commandMap;
		}
		
		public function map(type:*):IMapSetter
		{
			_mappingType = type;
			return this;
		}
		
		public function toMediate(viewClass:Class):IMediatorMap
		{
			checkType();
			_mediatorMap.map(_mappingType).toMediate(viewClass);
			_mappingType = null;
			return _mediatorMap;
		}
		
		public function asSingleton(singletonClass:Class):IInstanceMap
		{
			checkType();
			_instanceMap.map(_mappingType).asSingleton(singletonClass);
			_mappingType = null;
			return _instanceMap;
		}
		
		public function toValue(value:Object):IInstanceMap
		{
			checkType();
			_instanceMap.map(_mappingType).toValue(value);
			_mappingType = null;
			return _instanceMap;
		}
		
		public function toCommand(commandClass:Class):ICommandMap
		{
			checkType();
			_commandMap.map(_mappingType).toCommand(commandClass);
			_mappingType = null;
			return _commandMap;
		}
		
		public function unmap(type:*):void
		{
			if (!type) throw new ArgumentError("Argument is null!");
			switch (true) {
				case _mediatorMap.hasMediator(type):
					_mediatorMap.unmap(type);
					break;
				case _instanceMap.hasOf(type):
					_instanceMap.unmap(type);
					break;
				case _commandMap.hasEventType(type):
					_commandMap.unmap(type);
					break;
			}
		}
		
		private function checkType():void
		{
			if (!_mappingType) throw new ArgumentError("Missing type! First call map(type:*) method!");
		}
	}
}
