/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.interfaces
{
	public interface IMapSetter
	{
		function asSingleton(singletonClass:Class):IInstanceMap;
		function toValue(value:Object):IInstanceMap;
		function toMediator(mediatorClass:Class):IMediatorMap;
		function toCommand(commandClass:Class):ICommandMap;
	}
}
