package ru.arslanov.starling.mvc.interfaces
{
	public interface IInjectorSetter
	{
		function asSingleton(singletonClass:Class):*;
		function toValue(value:Object):*;
	}
}
