package ru.arslanov.starling.mvc.interfaces
{
	public interface IInstanceSetter
	{
		function asSingleton(singletonClass:Class):*;
		function toValue(value:Object):*;
	}
}
